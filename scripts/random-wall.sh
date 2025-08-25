#!/usr/bin/env bash

WALL_DIR=/home/jaq/wallpapers/dots
RANDOM_WALL=$(find $WALL_DIR -type f -print0 | shuf -z -n 1 | tr -d '\0')

ln -sf $RANDOM_WALL ~/.cache/.current-wall

swww img "$RANDOM_WALL" --transition-type any --transition-duration 0.5 --transition-fps 120
