#!/usr/bin/env bash

NIX_CONFIG="/home/jaq/dots/dots/nix/configuration.nix"
HARDWARE_NIX_CONFIG="/home/jaq/dots/dots/nix/hardware-configuration.nix"

if [ ! -f "$NIX_CONFIG" ]; then
    mv /etc/nixos/configuration.nix "$NIX_CONFIG"
fi

if [ ! -f "$HARDWARE_NIX_CONFIG" ]; then
    mv /etc/nixos/hardware-configuration.nix "$HARDWARE_NIX_CONFIG"
fi
