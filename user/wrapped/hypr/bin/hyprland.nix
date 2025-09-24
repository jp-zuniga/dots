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
    theme.cursor.hypr.package
  ];

  buildInputs = [pkgs.makeWrapper];
  postBuild = ''
    wrapProgram $out/bin/hyprland --add-flags "-c ${conf}"
  '';
}
