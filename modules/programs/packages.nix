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
      base.desktop code-url-handler.desktop  cups.desktop \
      draw.desktop fish.desktop impress.desktop math.desktop \
      mpv.desktop nixos-manual.desktop startcenter.desktop \
      writer.desktop yazi.desktop
    do
      rm -f "$out/share/applications/$file" || true
    done

    rename() {
      [ -f "$1" ] && sed -i "s/$2/$3/" "$1" || true
    }

    rename "$out/share/applications/android-studio.desktop" "Android Studio (stable channel)" "Android Studio"
    rename "$out/share/applications/calc.desktop" "LibreOffice Calc" "Calc"
    rename "$out/share/applications/code.desktop" "Visual Studio Code" "Code"
    rename "$out/share/applications/idea.desktop" "IntelliJ IDEA" "IDEA"
    rename "$out/share/applications/org.prismlauncher.PrismLauncher.desktop" "Prism Launcher" "Minecraft"
    rename "$out/share/applications/virt-manager.desktop" "Virtual Machine Manager" "VM Manager"
    rename "$out/share/applications/writer.desktop" "LibreOffice Writer" "Writer"
  '';
in {
  environment = {
    extraSetup = customizeDesktopEntries;
    systemPackages = [
      pkgs.alejandra
      pkgs.delta
      pkgs.discord
      pkgs.dust
      pkgs.hyperfine
      pkgs.libreoffice-fresh
      pkgs.microfetch
      pkgs.mpv
      pkgs.pastel
      pkgs.pik
      pkgs.ripgrep
      pkgs.qview
      pkgs.tealdeer
      pkgs.zoxide
    ];

    variables = {
      HYPRCURSOR_SIZE = theme.cursor.size;
      HYPRCURSOR_THEME = theme.cursor.hypr.name;
      XCURSOR_SIZE = theme.cursor.size;
      XCURSOR_THEME = theme.cursor.x.name;
    };
  };
}
