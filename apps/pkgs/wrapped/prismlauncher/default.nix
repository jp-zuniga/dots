{
  pkgs,
  theme,
  ...
}:
pkgs.symlinkJoin {
  name = "prismlauncher-wrapped";
  paths = [
    pkgs.jre25_minimal
    pkgs.libxrender
    pkgs.prismlauncher
    theme.cursor.hypr.package
  ];

  buildInputs = [pkgs.makeWrapper];
}
