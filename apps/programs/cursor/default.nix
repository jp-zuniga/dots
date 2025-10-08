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
    mkdir -p $out/share/icons/default

    ln -s ${pkg}/share/icons/${name} $out/share/icons/${name}
    ln -s ${pkg}/share/icons/${name}/cursors $out/share/icons/default/cursors
  '';
}
