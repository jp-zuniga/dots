{
  lib,
  pkgs,
  theme,
  ...
}: {
  options.sys.cursor = lib.mkOption {
    description = "Themed cursor package.";
    type = lib.types.package;
  };

  config = let
    inherit (theme.cursor) name package;

    cursor = pkgs.runCommandLocal "cursor" {} ''
      mkdir -p $out/share/icons
      mkdir -p $out/share/icons/default

      ln -sf ${package}/share/icons/${name} $out/share/icons/${name}
      ln -sf ${package}/share/icons/${name}/cursors $out/share/icons/default/cursors
    '';
  in {
    environment.systemPackages = [cursor];

    sys = {
      inherit cursor;
    };
  };
}
