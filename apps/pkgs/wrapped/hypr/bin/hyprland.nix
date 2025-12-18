{
  conf,
  pkgs,
  theme,
  ...
}:
pkgs.symlinkJoin {
  name = "hyprland-wrapped";
  paths = [
    pkgs.brightnessctl
    pkgs.brillo
    pkgs.hyprland
    pkgs.hyprpicker
    pkgs.libnotify
    pkgs.hyprshot
    pkgs.playerctl
    pkgs.swww
    pkgs.xdg-desktop-portal-hyprland
    pkgs.xkeyboard_config
    theme.cursor.hypr.package
  ];

  buildInputs = [pkgs.makeWrapper];
  postBuild = ''
    wrapProgram $out/bin/hyprland --add-flags "-c ${conf}"
  '';
}
