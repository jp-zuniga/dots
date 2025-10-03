{
  inputs,
  lib,
  pkgs,
  ...
}: let
  unstable = import inputs.nixpkgs-unstable {system = pkgs.stdenv.hostPlatform.system;};
in {
  imports = [
    ./pkgs
    ./programs
  ];

  environment = {
    extraSetup = ''
      set -eu

      for file in \
        Alacritty.desktop base.desktop btop.desktop code-url-handler.desktop \
        cups.desktop draw.desktop fish.desktop math.desktop mpv.desktop \
        nixos-manual.desktop startcenter.desktop yazi.desktop
      do
        rm -f "$out/share/applications/$file" || true
      done

      rename() {
        [ -f "$1" ] && sed -i "s/$2/$3/" "$1" || true
      }

      rename "$out/share/applications/gimp.desktop" "GNU Image Manipulation Program" "GIMP"
      rename "$out/share/applications/idea-ultimate.desktop" "IntelliJ IDEA" "IDEA"
      rename "$out/share/applications/calc.desktop" "LibreOffice Calc" "Calc"
      rename "$out/share/applications/impress.desktop" "LibreOffice Impress" "Impress"
      rename "$out/share/applications/writer.desktop" "LibreOffice Writer" "Writer"
      rename "$out/share/applications/virt-manager.desktop" "Virtual Machine Manager" "VM Manager"
      rename "$out/share/applications/code.desktop" "Visual Studio Code" "Code"
    '';

    systemPackages = [
      pkgs.alejandra
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
      unstable.railway
    ];
  };

  programs = {
    hyprland.enable = true;
    java = {
      enable = true;
      package = pkgs.jdk17;
    };
  };
}
