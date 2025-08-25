#!/usr/bin/env bash

MODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')

if [ "$MODE" = 1 ] ; then
    kill $(pgrep waybar)
    hyprctl --batch "\
        keyword animations:enabled 0;\
        keyword animations:borderangle,0;\
        keyword decoration:blur:enabled 0;\
	    keyword decoration:fullscreen_opacity 1;\
	    keyword decoration:inactive_opacity 1;\
        keyword decoration:rounding 0;\
        keyword decoration:shadow:enabled 0;\
        keyword general:border_size 1;\
        keyword general:gaps_in 0;\
        keyword general:gaps_out 0;"
    exit 0
else
    waybar &
    hyprctl reload
    exit 0
fi

exit 1
