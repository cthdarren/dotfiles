#!/usr/bin/env python3
"""Estimate battery time remaining from the last 30 min of UPower rate history.

Usage:
  battery-estimate.py            -> "4h 20min left"
  battery-estimate.py --json     -> waybar custom-module JSON
  battery-estimate.py --minutes 15 / --device battery_BAT1
"""
import argparse
import json
import subprocess
import time

UPOWER = "org.freedesktop.UPower"
IFACE = "org.freedesktop.UPower.Device"
# UPower states: 1 charging, 2 discharging, 3 empty, 4 fully charged, 5 pending charge, 6 pending discharge
CHARGING, DISCHARGING, FULL = 1, 2, 4


def busctl(path, *args):
    out = subprocess.run(["busctl", "--json=short", *args[:1], UPOWER, path, *args[1:]],
                         capture_output=True, text=True, check=True).stdout
    return [json.loads(line)["data"] for line in out.splitlines() if line.strip()]


def props(path, *names):
    return dict(zip(names, busctl(path, "get-property", IFACE, *names)))


def avg_rate(path, state, window):
    """Time-weighted mean power draw (W) over the window, only since the last state change."""
    hist = busctl(path, "call", IFACE, "GetHistory", "suu", "rate", str(window), "1000")[0][0]
    now = int(time.time())
    hist = sorted((t, r, s) for t, r, s in hist if t >= now - window)
    # keep only the trailing run of samples in the current state
    run = []
    for t, r, s in reversed(hist):
        if s != state:
            break
        run.append((t, r))
    run.reverse()
    if not run:
        return None
    total = weight = 0.0
    for i, (t, r) in enumerate(run):
        nxt = run[i + 1][0] if i + 1 < len(run) else now
        dt = max(nxt - t, 1)
        total += r * dt
        weight += dt
    return total / weight if weight else None


def fmt(hours):
    mins = int(round(hours * 60))
    h, m = divmod(mins, 60)
    return f"{h}h {m}min" if h else f"{m}min"


def estimate(device, minutes):
    path = f"/org/freedesktop/UPower/devices/{device}"
    p = props(path, "State", "Energy", "EnergyFull", "EnergyRate", "Percentage",
              "ChargeThresholdEnabled", "ChargeEndThreshold")
    state, energy = p["State"], p["Energy"]
    rate = avg_rate(path, state, minutes * 60) or p["EnergyRate"]
    info = {"state": state, "percentage": p["Percentage"], "rate_now": p["EnergyRate"],
            "rate_avg": rate, "hours": None}
    if rate and rate > 0.05:
        if state == DISCHARGING:
            info["hours"] = energy / rate
        elif state == CHARGING:
            limit = p["ChargeEndThreshold"] if p["ChargeThresholdEnabled"] else 100
            target = p["EnergyFull"] * limit / 100
            info["hours"] = max(target - energy, 0) / rate
    return info


def describe(info):
    if info["state"] == FULL:
        return "Fully charged"
    if info["hours"] is None:
        return "Not charging" if info["state"] != DISCHARGING else "Estimating…"
    suffix = "until full" if info["state"] == CHARGING else "left"
    return f"{fmt(info['hours'])} {suffix}"


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--device", default="battery_BAT0")
    ap.add_argument("--minutes", type=int, default=30)
    ap.add_argument("--json", action="store_true")
    a = ap.parse_args()
    info = estimate(a.device, a.minutes)
    text = describe(info)
    if not a.json:
        print(text)
        return
    pct = round(info["percentage"])
    # Same glyphs/formats as the original built-in battery module
    icons = ["", "", "", "", ""]
    icon = icons[min(pct // 20, 4)]
    state = info["state"]
    if state == CHARGING:
        text = f"{pct}% "
    elif state == FULL:
        text = f"{pct}% {icon}"
    elif state == 5:  # pending-charge: plugged in, held at threshold
        text = f"{pct}% "
    else:
        text = f"{icon}  {pct}%"
    cls = "charging" if state == CHARGING else (
        "critical" if pct <= 15 else "warning" if pct <= 30 else "normal")
    print(json.dumps({"text": text, "tooltip": describe(info),
                      "class": cls, "percentage": pct}))

if __name__ == "__main__":
    main()
