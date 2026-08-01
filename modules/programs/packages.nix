{
  pkgs,
  theme,
  unfree-pkgs,
  unfree-unstable,
  ...
}: let
  customizeDesktopEntries = ''
    set -eu

    for file in \
      base.desktop bluetui.desktop code-url-handler.desktop \
      cups.desktop draw.desktop fish.desktop impress.desktop \
      math.desktop mpv.desktop nixos-manual.desktop \
      qt5ct.desktop qt6ct.desktop yazi.desktop
    do
      rm -f "$out/share/applications/$file" || true
    done

    rename() {
      [ -f "$1" ] && sed -i "s/$2/$3/" "$1" || true
    }

    rename "$out/share/applications/code.desktop" "Visual Studio Code" "Code"
    rename "$out/share/applications/org.prismlauncher.PrismLauncher.desktop" "Prism Launcher" "Minecraft"
  '';
in {
  environment = {
    extraSetup = customizeDesktopEntries;
    systemPackages = [
      pkgs.alejandra
      pkgs.awww
      pkgs.bluetui
      pkgs.brightnessctl
      pkgs.brillo
      pkgs.delta
      pkgs.discord
      pkgs.dust
      pkgs.hyprpicker
      pkgs.hyprshot
      pkgs.libnotify
      pkgs.libreoffice
      pkgs.microfetch
      pkgs.mpv
      pkgs.nil
      pkgs.pastel
      pkgs.playerctl
      pkgs.ripgrep
      pkgs.shfmt
      pkgs.statix
      pkgs.qview
      pkgs.tealdeer
      pkgs.tokei
      pkgs.uv
      pkgs.zoxide
      unfree-pkgs.claude-code
      unfree-unstable.spotify
    ];

    variables = {
      HYPRCURSOR_SIZE = theme.cursor.size;
      HYPRCURSOR_THEME = theme.cursor.name;
      XCURSOR_SIZE = theme.cursor.size;
      XCURSOR_THEME = theme.cursor.name;
    };
  };
}
