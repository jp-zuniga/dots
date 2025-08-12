#!/usr/bin/env bash

OG_NIX_CONFIG="/etc/nixos/configuration.nix"
OG_HARDWARE_CONFIG="/etc/nixos/hardware-configuration.nix"

DOTS_NIX_CONFIG="/home/jaq/dots/dots/nix/configuration.nix"
DOTS_HARDWARE_CONFIG="/home/jaq/dots/dots/nix/hardware-configuration.nix"

if [ ! -f "$DOTS_HARDWARE_CONFIG" ]; then
    echo "$DOTS_HARDWARE_CONFIG does not exist."
    mv "$OG_HARDWARE_CONFIG" "$DOTS_HARDWARE_CONFIG"
    echo "Moved $OG_HARDWARE_CONFIG to $DOTS_HARDWARE_CONFIG."
fi

if [ -e "$OG_NIX_CONFIG" ]; then
    echo "Deleting $OG_NIX_CONFIG."
    sudo rm -f "$OG_NIX_CONFIG"

    read -p "Do you want to rebuild the system from $DOTS_NIX_CONFIG? (y/N)" REBUILD

    if [ "$REBUILD" = "" ] || [ "$REBUILD" = "N" ] || [ "$REBUILD" = "n" ]; then
        echo "You must do so manually by running:"
        echo "  $ sudo nixos-rebuild switch --file $DOTS_NIX_CONFIG"
    elif [ "$REBUILD" = "y" ] || [ "$REBUILD" = "Y" ]; then
        echo "Executing nixos-rebuild switch."
        sudo nixos-rebuild switch --file "$DOTS_NIX_CONFIG"
    fi
fi
