{
  lib,
  pkgs,
  theme,
  unstable,
  ...
}: let
  customizeDesktopEntries = ''
    set -eu

    for file in \
      base.desktop code-url-handler.desktop \
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
in {
  environment = {
    extraSetup = customizeDesktopEntries;
    systemPackages = [
      pkgs.alejandra
      pkgs.bat-extras.batman
      pkgs.delta
      pkgs.discord
      pkgs.dust
      pkgs.gimp3
      pkgs.libreoffice-fresh
      pkgs.microfetch
      pkgs.mpv
      pkgs.pastel
      pkgs.pik
      pkgs.ripgrep
      pkgs.qview
      pkgs.tealdeer
      pkgs.zoxide
      unstable.just
      unstable.uv
    ];

    variables = {
      HYPRCURSOR_SIZE = theme.cursor.size;
      HYPRCURSOR_THEME = theme.cursor.hypr.name;
      XCURSOR_SIZE = theme.cursor.size;
      XCURSOR_THEME = theme.cursor.x.name;
    };
  };
}
