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
    pkgs.discord
    pkgs.dust
    pkgs.gimp3
    pkgs.jetbrains.idea-ultimate
    pkgs.libreoffice-fresh
    pkgs.microfetch
    pkgs.mpv
    pkgs.pastel
    pkgs.qview
    pkgs.uv
  ];
}
