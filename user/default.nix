{pkgs, ...}: let
  theme = import ./theme;
  packages = let
    inherit (pkgs) callPackage;
    theme = import ./theme pkgs;
  in {
    alacritty = callPackage ./wrapped/alacritty {inherit theme;};
    bat = callPackage ./wrapped/bat {inherit theme;};
    btop = callPackage ./wrapped/btop {inherit theme;};
    hypr = callPackage ./wrapped/hypr {inherit theme;};
    mako = callPackage ./wrapped/mako {inherit theme;};
    waybar = callPackage ./wrapped/waybar {inherit theme;};
  };
in {
  inherit packages;

  module = {pkgs, ...}: let
    theme = import ./theme pkgs;
  in {
    config = {
      environment.systemPackages = builtins.attrValues packages;
      programs.hyprland = {
        enable = true;
      };
    };

    imports = [
      ./packages.nix
      ./eza
      ./firefox
      ./fish
      ./git
      ./gtk
      ./qbittorrent
      ./starship
      ./steam
      ./vscode
      ./yazi
    ];
  };
}
