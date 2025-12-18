{
  lib,
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
    ./jetbrains
    ./packettracer
    ./qbittorrent
    ./qt
    ./spotify
    ./starship
    ./steam
    ./sunsetr
    ./vscode
    ./yazi
  ];

  environment.systemPackages = [
    cursor-theme

    # minecraft!
    (pkgs.prismlauncher.override {
      additionalPrograms = [pkgs.libxrender];
    })
  ];
}
