{
  pkgs,
  lib,
  theme,
}: let
  hyprColors = import ./hyprcolors.nix {inherit lib theme;};
  toHyprConf = import ./tohyprconf.nix lib;
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
        config = pkgs.writeText "${x}.conf" (toHyprConf {
          attrs = import ./configs/${x}.nix hyprColors;
        });
      in ''
        wrapProgram $out/bin/${x} --add-flags "-c ${config}"
      '';
    })) ["hyprland" "hyprlock" "hypridle"];
  }
