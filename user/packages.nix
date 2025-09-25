{
  inputs,
  lib,
  pkgs,
  ...
}: let
  theme = import ./theme pkgs;
  unstable = import inputs.nixpkgs-unstable {
    system = "x86_64-linux";
  };

  hyprPkgs = import ./wrapped/hypr {inherit lib pkgs theme unstable;};
  scripts = import ./scripts {inherit pkgs theme;};
in {
  environment = {
    systemPackages = let
      inherit hyprPkgs;
    in
      builtins.attrValues scripts
      ++ [
        hyprPkgs.hypridle-wrapped
        hyprPkgs.hyprland-wrapped
        hyprPkgs.hyprlock-wrapped

        (pkgs.callPackage ./wrapped/alacritty {inherit theme;})
        (pkgs.callPackage ./wrapped/bat {inherit theme;})
        (pkgs.callPackage ./wrapped/btop {inherit theme;})
        (pkgs.callPackage ./wrapped/mako {inherit theme;})
        (pkgs.callPackage ./wrapped/rofi {inherit theme;})
        (pkgs.callPackage ./wrapped/sunsetr {inherit pkgs unstable;})
        (pkgs.callPackage ./wrapped/waybar {inherit theme;})

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
        pkgs.playerctl
        pkgs.swww
        pkgs.qview
        pkgs.uv
      ];

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
  };

  programs = {
    hyprland.enable = true;
    java = {
      enable = true;
      package = pkgs.jdk17;
    };
  };
}
