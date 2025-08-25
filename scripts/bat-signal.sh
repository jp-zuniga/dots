#!/usr/bin/env bash
# Loop to monitor battery level

while true; do
    battery_path=$(upower -e | grep -m 1 battery)

    if [ -z "$battery_path" ]; then
        echo "ERROR: Could not find a battery. Exiting."
        exit 1
    fi

    battery_percent=$(\
        upower -i "$battery_path" | grep -E "percentage" | \
        awk '{print $2}' | tr -d '%' \
    )

    if ! [[ "$battery_percent" =~ ^[0-9]+$ ]]; then
        echo "ERROR: Could not parse battery percentage: '$battery_percent'"
        sleep 300
        continue
    fi

    if [ "$battery_percent" -le 20 ]; then
        echo "Battery low: ${battery_percent}%. Sending notification."
        notify-send "Low battery!"
    fi

    sleep 300  # check back in 5 mins
done
