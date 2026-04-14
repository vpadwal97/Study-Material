#!/bin/bash

# 1. Get your phone's IP address from the hotspot gateway
PHONE_IP=$(ip route | grep default | awk '{print $3}')

if [ -z "$PHONE_IP" ]; then
    echo "ERROR: Not connected to your phone's hotspot."
    read -p "Press Enter to exit..."
    exit 1
fi

echo "Phone detected at hotspot IP: $PHONE_IP"

# 2. Connect to the phone wirelessly
adb connect $PHONE_IP:5555

# 3. Wait for the connection to settle
sleep 2

# 4. Launch scrcpy with optimized settings for Wi-Fi
scrcpy -e --bit-rate 4M --max-size 1024 --always-on-top
