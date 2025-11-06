{
  conf,
  pkgs,
  theme,
  ...
}:
pkgs.symlinkJoin {
  name = "hyprland-wrapped";
  paths = [
    pkgs.hyprland
    pkgs.xkeyboard_config
    theme.cursor.hypr.package
  ];

  buildInputs = [pkgs.makeWrapper];
  postBuild = ''
    wrapProgram $out/bin/hyprland --add-flags "-c ${conf}"
  '';
}
