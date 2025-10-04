{
  pkgs,
  theme,
  ...
}: let
  inherit (import ./cursor {inherit pkgs theme;}) cursor-theme;
in {
  imports = [
    ./eza
    ./fish
    ./firefox
    ./git
    ./gtk
    ./packettracer
    ./qbittorrent
    ./qt
    ./spotify
    ./starship
    ./steam
    ./vscode
    ./yazi
  ];

  environment.systemPackages = [
    cursor-theme
    pkgs.bc
    pkgs.brightnessctl
    pkgs.brillo
    pkgs.delta
    pkgs.hyprpicker
    pkgs.hyprshot
    pkgs.hyprsunset
    pkgs.jq
    pkgs.libnotify
    pkgs.swww
    pkgs.xdg-desktop-portal-hyprland
  ];
}
