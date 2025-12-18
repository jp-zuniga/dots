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
    bat = pkgs.callPackage ./bat {inherit theme;};
    btop = pkgs.callPackage ./btop {inherit theme;};
    mako = pkgs.callPackage ./mako {inherit theme;};
    prismlauncher = pkgs.callPackage ./prismlauncher {inherit theme;};
    rofi = pkgs.callPackage ./rofi {inherit theme;};
    sunsetr = pkgs.callPackage ./sunsetr {inherit pkgs;};
    waybar = pkgs.callPackage ./waybar {inherit theme;};
  }
