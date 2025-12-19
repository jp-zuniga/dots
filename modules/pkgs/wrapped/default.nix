{
  lib,
  pkgs,
  theme,
  ...
}: let
  hyprPkgs = import ./hypr {inherit lib pkgs theme;};
in
  hyprPkgs
  // {
    alacritty = pkgs.callPackage ./alacritty {inherit theme;};
    bat = pkgs.callPackage ./bat.nix {inherit theme;};
    btop = pkgs.callPackage ./btop {inherit theme;};
    mako = pkgs.callPackage ./mako.nix {inherit theme;};
    rofi = pkgs.callPackage ./rofi {inherit theme;};
    waybar = pkgs.callPackage ./waybar {inherit theme;};
  }
