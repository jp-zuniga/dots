{pkgs, ...}: {
  imports = [
    ./eza
    ./fish
    ./firefox
    ./git
    ./gtk
    ./qbittorrent
    ./qt
    ./spotify
    ./starship
    ./steam
    ./vscode
    ./yazi
  ];

  environment.systemPackages = [
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
  ];
}
