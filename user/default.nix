{
  inputs,
  pkgs,
  ...
}: let
  theme = import ./theme;
  packages = let
    theme = import ./theme pkgs;
  in {
    alacritty = pkgs.callPackage ./wrapped/alacritty {inherit theme;};
    bat = pkgs.callPackage ./wrapped/bat {inherit theme;};
    btop = pkgs.callPackage ./wrapped/btop {inherit theme;};
    hypr = pkgs.callPackage ./wrapped/hypr {inherit theme;};
    mako = pkgs.callPackage ./wrapped/mako {inherit theme;};
    rofi = pkgs.callPackage ./wrapped/rofi {inherit theme;};
    waybar = pkgs.callPackage ./wrapped/waybar {inherit theme;};

    focus = import ./scripts/focus pkgs;
    random-wall = import ./scripts/random-wall pkgs;
    rebuild = import ./scripts/rebuild pkgs;
    upgrade = import ./scripts/upgrade pkgs;
  };
in {
  inherit packages;

  module = {pkgs, ...}: let
    theme = import ./theme pkgs;
  in {
    config = {
      environment.sessionVariables = {
        XDG_CACHE_HOME = "$HOME/.cache";
        XDG_CONFIG_HOME = "$HOME/.config";
        XDG_DATA_HOME = "$HOME/.local/share";
        XDG_DOCUMENTS_DIR = "$HOME/docs";
        XDG_DOWNLOAD_DIR = "$HOME/dwnlds";
        XDG_MUSIC_DIR = "$HOME/moosic";
        XDG_PICTURES_DIR = "$HOME/pics";
        XDG_STATE_HOME = "$HOME/.local/state";
      };

      environment.systemPackages = builtins.attrValues packages;
      programs = {
        hyprland = {
          enable = true;
        };

        java = {
          enable = true;
          package = pkgs.jdk17;
        };
      };
    };

    imports = [
      ./eza
      ./firefox
      ./fish
      ./git
      ./gtk
      ./qt
      ./qbittorrent
      ./spotify
      ./starship
      ./steam
      ./vscode
      ./yazi

      ./wrapped/btop/btop-theme.nix
      ./packages.nix
    ];
  };
}
