{
  inputs,
  pkgs,
  ...
}: let
  unstable = import inputs.nixpkgs-unstable {
    system = "x86_64-linux";
  };
in {
  environment = {
    systemPackages = let
      scripts = import ./scripts {inherit pkgs theme;};
      theme = import ./theme pkgs;
    in
      builtins.attrValues scripts
      ++ [
        (pkgs.callPackage ./wrapped/alacritty {inherit theme;})
        (pkgs.callPackage ./wrapped/bat {inherit theme;})
        (pkgs.callPackage ./wrapped/btop {inherit theme;})
        (pkgs.callPackage ./wrapped/hypr {inherit theme;})
        (pkgs.callPackage ./wrapped/mako {inherit theme;})
        (pkgs.callPackage ./wrapped/rofi {inherit theme;})
        (pkgs.callPackage ./wrapped/waybar {inherit theme;})

        pkgs.alejandra
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

        unstable.sunsetr
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
        [ -f "$1" ] && sed -i "s/$2/$3/" "$file" || true
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
