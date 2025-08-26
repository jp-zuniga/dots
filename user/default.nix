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
