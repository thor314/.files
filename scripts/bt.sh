#!/bin/bash

# Fetch the current power status of Bluetooth
current_status=$(bluetoothctl show | grep "Powered" | awk '{ print $2 }')

if [ "$current_status" = "yes" ]; then
    # Bluetooth is on, turn it off
    echo "Turning Bluetooth off..."
    bluetoothctl power off
elif [ "$current_status" = "no" ]; then
    # Bluetooth is off, turn it on
    echo "Turning Bluetooth on..."
    bluetoothctl power on
else
    echo "Error: Could not determine Bluetooth power status."
fi
