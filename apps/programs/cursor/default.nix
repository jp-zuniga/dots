{
  pkgs,
  theme,
  ...
}: let
  name = theme.cursor.x.name;
  pkg = theme.cursor.x.package;
in {
  cursor-theme = pkgs.runCommandLocal "cursor-theme" {} ''
    mkdir -p $out/share/icons
    ln -s ${pkg}/share/icons/${name} $out/share/icons/default
    ln -s ${pkg}/share/icons/${name} $out/share/icons/${name}
  '';
}
