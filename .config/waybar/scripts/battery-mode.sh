#!/usr/bin/env bash
# Charge-mode button for waybar.
#   battery-mode.sh          -> waybar JSON showing the current mode
#   battery-mode.sh toggle   -> switch Optimised (75–80%) <-> Full Charge (100%)
DEV=/org/freedesktop/UPower/devices/battery_BAT0
IFACE=org.freedesktop.UPower.Device

enabled() {
    [[ $(busctl get-property org.freedesktop.UPower "$DEV" "$IFACE" ChargeThresholdEnabled) == "b true" ]]
}

if [[ $1 == toggle ]]; then
    if enabled; then next=false; name="Full Charge"; else next=true; name="Optimised"; fi
    if busctl call org.freedesktop.UPower "$DEV" "$IFACE" EnableChargeThreshold b "$next"; then
        notify-send -i battery "Battery" "Charge mode: $name"
    else
        notify-send -u critical -i battery "Battery" "Failed to switch charge mode"
    fi
    pkill -RTMIN+8 waybar   # refresh battery + mode modules
    exit
fi

if enabled; then
    printf '{"text":"\\uf06c  Optimised","tooltip":"Charging stops at 80%%, resumes below 75%%\\nClick for Full Charge","class":"optimised"}\n'
else
    printf '{"text":"\\uf240  Full Charge","tooltip":"Charging to 100%%\\nClick for Optimised (75–80%%)","class":"full"}\n'
fi
