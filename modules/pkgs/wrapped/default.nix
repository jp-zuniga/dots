{
  flake,
  lib,
  pkgs,
  theme,
  unstable,
  ...
}: let
  inherit (pkgs) callPackage;

  hyprPkgs = import ./hypr {inherit lib pkgs theme;};
in
  hyprPkgs
  // {
    alacritty = callPackage ./alacritty {inherit flake pkgs theme;};
    bat = callPackage ./bat.nix {inherit pkgs theme;};
    btop = callPackage ./btop {inherit pkgs theme;};
    dunst = callPackage ./dunst {inherit pkgs theme;};
    rofi = callPackage ./rofi {inherit pkgs theme;};
    waybar = callPackage ./waybar {inherit pkgs theme;};
    wifitui = callPackage ./wifitui {inherit flake pkgs theme unstable;};
  }
