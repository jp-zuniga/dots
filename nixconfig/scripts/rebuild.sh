#!/usr/bin/env bash
# Based on: https://gist.github.com/0atman/1a5133b842f929ba4c1e195ee67599d5
# Wrapper for 'nixos-rebuild switch' that commits on a succesful build.

CONFIG=~/dots/dotfiles/nix/configuration.nix
F_LOG=~/.nixos-format.log
S_LOG=~/.nixos-switch.log

set -e
pushd ~/dots/dotfiles/nix/

# Early return if no changes are detected
if git diff --quiet "*.nix"; then
    echo "No changes detected, exiting." && exit 0
fi

# Autoformat nix files
alejandra . &> $F_LOG || (echo "Formatting failed!" && exit 1)

# Show changes
git diff -U0 "*.nix"

echo "\nRebuilding system...\n"

# Rebuild, output simplified errors, log trackebacks
sudo nixos-rebuild switch -I nixos-config=$CONFIG &> $S_LOG || \
    (cat $S_LOG | grep --color error && \
     notify-send "NixOS rebuild failed!" && exit 1)

# Commit all changes with generation number
git commit -am "Generation #$(\
    nixos-rebuild list-generations | grep current | awk '{print $1}' \
)"

# Wrap-up
popd
notify-send "NixOS rebuild successful!"
