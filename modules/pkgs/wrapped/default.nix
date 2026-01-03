{
  flake,
  lib,
  pkgs,
  theme,
  ...
}: let
  inherit (pkgs) callPackage;

  hyprPkgs = import ./hypr {inherit lib pkgs theme;};
in
  hyprPkgs
  // {
    alacritty = callPackage ./alacritty {inherit flake theme;};
    bat = callPackage ./bat.nix {inherit theme;};
    btop = callPackage ./btop {inherit theme;};
    mako = callPackage ./mako.nix {inherit theme;};
    rofi = callPackage ./rofi {inherit theme;};
    waybar = callPackage ./waybar {inherit theme;};
  }
