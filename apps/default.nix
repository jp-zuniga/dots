{
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./pkgs
    ./programs
  ];

  environment.systemPackages = [
    pkgs.alejandra
    pkgs.bat-extras.batdiff
    pkgs.bat-extras.batgrep
    pkgs.bat-extras.batman
    pkgs.bc
    pkgs.brightnessctl
    pkgs.brillo
    pkgs.clang-tools
    pkgs.delta
    pkgs.discord
    pkgs.dust
    pkgs.gimp3
    pkgs.hyprpicker
    pkgs.hyprshot
    pkgs.hyprsunset
    pkgs.jetbrains.idea-ultimate
    pkgs.jq
    pkgs.libnotify
    pkgs.libreoffice-fresh
    pkgs.microfetch
    pkgs.mpv
    pkgs.pastel
    pkgs.swww
    pkgs.qview
    pkgs.uv
  ];
}
