{
  lib,
  pkgs,
  theme,
  ...
}: {
  options.sys.cursor = lib.mkOption {
    type = lib.types.package;
    description = "Themed cursor package.";
  };

  config = let
    name = theme.cursor.x.name;
    pkg = theme.cursor.x.package;

    cursor = pkgs.runCommandLocal "cursor" {} ''
      mkdir -p $out/share/icons
      mkdir -p $out/share/icons/default

      ln -sf ${pkg}/share/icons/${name} $out/share/icons/${name}
      ln -sf ${pkg}/share/icons/${name}/cursors $out/share/icons/default/cursors
    '';
  in {
    environment.systemPackages = [cursor];

    sys = {
      inherit cursor;
    };
  };
}
