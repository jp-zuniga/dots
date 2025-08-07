#!/usr/bin/env bash

WALL_DIR=/home/jaq/dots/dots/wallpapers/
CURRENT_WALL=/home/jaq/dots/dots/wallpapers/.current.png

cp $(find $WALL_DIR -type f -print0 | shuf -z -n 1 | tr -d '\0') $CURRENT_WALL

swww img $CURRENT_WALL --transition-type any --transition-duration 0.5
