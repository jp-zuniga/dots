{
  lib,
  pkgs,
  theme,
  users,
  ...
}: let
  inherit (pkgs) callPackage;

  hyprPkgs = import ./hypr {inherit lib pkgs theme users;};
in
  hyprPkgs
  // {
    alacritty = callPackage ./alacritty {inherit theme;};
    bat = callPackage ./bat.nix {inherit theme;};
    btop = callPackage ./btop {inherit theme;};
    mako = callPackage ./mako.nix {inherit theme;};
    rofi = callPackage ./rofi {inherit theme;};
    waybar = callPackage ./waybar {inherit theme;};
  }
