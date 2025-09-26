{
  pkgs,
  theme,
  ...
}:
pkgs.runCommandLocal "system-cursor-theme" {} ''
  mkdir -p $out/share/icons
  ln -s ${theme.cursor.x.package}/share/icons/BreezeX-RosePine-Linux $out/share/icons/default
''
