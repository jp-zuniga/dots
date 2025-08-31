#!/usr/bin/env bash

MODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')

if [ "$MODE" = 1 ] ; then
    ! pidof waybar  || pkill waybar &
    hyprctl keyword animations:enabled 0 &
    hyprctl keyword decoration:blur:enabled 0 &
    hyprctl keyword decoration:rounding 0 &
    hyprctl keyword decoration:shadow:enabled 0 &
    hyprctl keyword general:gaps_in 0 &
    hyprctl keyword general:gaps_out 0 &
    hyprctl keyword general:border_size 1 &
    exit 0
else
    hyprctl keyword animations:enabled 1 &
    hyprctl keyword decoration:blur:enabled 1 &
    hyprctl keyword decoration:rounding 5 &
    hyprctl keyword decoration:shadow:enabled 0 &
    hyprctl keyword general:gaps_in 5 &
    hyprctl keyword general:gaps_out 5 &
    hyprctl keyword general:border_size 3 &
    pidof waybar || waybar &
    exit 0
fi

exit 1
