#!/usr/bin/env bash

WALL_DIR=/home/jaq/wallpapers

# select a random subdirectory (excluding .git)
RANDOM_FLAVOR=$(\
    find $WALL_DIR -type d -name ".git" -prune -o -type d -print0 | \
    shuf -z -n 1 | tr -d '\0' \
)

# select a random file within that subdirectory
RANDOM_WALL=$(\
    find $RANDOM_FLAVOR -type f -print0 | \
    shuf -z -n 1 | tr -d '\0' \
)

mkdir -p ~/.cache
ln -sf $RANDOM_WALL ~/.cache/.current-wall

swww img "$RANDOM_WALL" \
    --transition-type any \
    --transition-duration 0.5 \
    --transition-fps 120
