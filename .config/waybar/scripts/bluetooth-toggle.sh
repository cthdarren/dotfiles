#!/usr/bin/env bash
# Toggle Bluetooth from waybar. Off = rfkill soft-block (radio fully powered down).
if rfkill list bluetooth | grep -q 'Soft blocked: yes' ||
   ! bluetoothctl show | grep -q 'Powered: yes'; then
    rfkill unblock bluetooth
    # bluetoothd usually auto-powers on after unblock; make sure
    for _ in 1 2 3 4 5; do
        bluetoothctl power on &>/dev/null && break
        sleep 0.4
    done
else
    bluetoothctl power off &>/dev/null
    rfkill block bluetooth
fi
