{
  pkgs,
  lib,
  theme,
  ...
}: let
  hyprColors = import ./hypr-colors.nix {inherit lib theme;};
  hyprConf = import ./hypr-conf.nix lib;
in
  pkgs.symlinkJoin {
    name = "hypr-and-friends";
    paths = builtins.map (x: (pkgs.symlinkJoin {
      name = "${x}-wrapped";
      paths = let
        pname = x;
      in [pkgs.${pname} theme.cursor.hypr.package];

      buildInputs = [pkgs.makeWrapper];
      postBuild = let
        config = pkgs.writeText "${x}.conf" (hyprConf {
          attrs = import ./config/${x}.nix hyprColors;
        });
      in ''
        wrapProgram $out/bin/${x} --add-flags "-c ${config}"
      '';
    })) ["hyprland" "hyprlock" "hypridle"];
  }
