#!/usr/bin/env bash

WALL_DIR=/home/jaq/dots/wallpapers/

CURRENT_WALL=/home/jaq/dots/wallpapers/.current.png

RANDOM_WALL=$(find $WALL_DIR -type f -print0 | shuf -z -n 1 | tr -d '\0')

cp "$RANDOM_WALL" "$CURRENT_WALL"

swww img "$CURRENT_WALL" --transition-type any --transition-duration 0.4 --transition-fps 120
