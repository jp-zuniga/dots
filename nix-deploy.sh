#!/usr/bin/env bash

NIX_CONFIG="/home/jaq/dots/dots/configuration.nix"
HARDWARE_NIX_CONFIG="/home/jaq/dots/dots/hardware-configuration.nix"

if ln -sf "$NIX_CONFIG" /etc/nixos/; then
    echo "Symbolic link to 'configuration.nix' created at '/etc/nixos/' successfully."
else
    echo "Failed to create symbolic link" >&2
    exit 1
fi

if [ ! -f "$HARDWARE_NIX_CONFIG" ]; then
    mv /etc/nixos/hardware-configuration.nix "$HARDWARE_NIX_CONFIG"
fi
