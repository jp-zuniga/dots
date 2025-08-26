#!/usr/bin/env bash
# Based on the work of 0atman:
# - https://gist.github.com/0atman/1a5133b842f929ba4c1e195ee67599d5
# ------------------------------------------------------------------
# NixOS rebuilder that commits on a successful build.

CONFIG=~/dots
HOST=t14s
F_LOG=~/.nixos-format.log
S_LOG=~/.nixos-switch.log

set -e
cd $CONFIG

# exit if the configuration hasn't changed
if git diff --quiet "*.nix"; then
    echo "No changes detected, exiting." && exit 0
fi

# autoformat
alejandra -q . &> $F_LOG || (echo "Formatting failed!" && exit 1)

# show changes
git diff -U0 "*.nix"

echo
echo "Rebuilding system..."

sudo nixos-rebuild switch --flake .#$HOST &> $S_LOG || \
    (cat $S_LOG | grep --color error && \
     notify-send --urgency=critical "NixOS rebuild failed!" && exit 1)

# commit all changes with generation number and hostname
git commit -am "Generation #$(\
    nixos-rebuild list-generations | grep current | awk '{print $1}' \
) on $HOST"

cd -
notify-send "NixOS rebuild successful!"
