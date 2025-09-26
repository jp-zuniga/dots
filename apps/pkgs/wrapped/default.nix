{
  lib,
  pkgs,
  unstable,
  theme,
  ...
}: let
  hyprPkgs = pkgs.callPackage ./hypr {inherit lib theme unstable;};
in
  hyprPkgs
  // {
    alacritty = pkgs.callPackage ./alacritty {inherit theme;};
    bat = pkgs.callPackage ./bat {inherit theme;};
    btop = pkgs.callPackage ./btop {inherit theme;};
    mako = pkgs.callPackage ./mako {inherit theme;};
    rofi = pkgs.callPackage ./rofi {inherit theme;};
    sunsetr = pkgs.callPackage ./sunsetr {inherit pkgs unstable;};
    waybar = pkgs.callPackage ./waybar {inherit theme;};
  }
