{
  lib,
  pkgs,
  theme,
  unstable,
  ...
}: let
  confConverter = import ./conf-converter.nix lib;
  hyprColors = import ./hypr-colors.nix {inherit lib theme;};
  hyprs = [
    {
      name = "hypridle-wrapped";
      conf = ./config/hypridle.nix;
      wrapper = ./bin/hypridle.nix;
      args = {inherit pkgs theme;};
    }
    {
      name = "hyprland-wrapped";
      conf = ./config/hyprland.nix;
      wrapper = ./bin/hyprland.nix;
      args = {
        inherit theme;
        pkgs = unstable;
      };
    }
    {
      name = "hyprlock-wrapped";
      conf = ./config/hyprlock.nix;
      wrapper = ./bin/hyprlock.nix;
      args = {inherit pkgs theme;};
    }
  ];
in
  builtins.listToAttrs (
    builtins.map (
      hypr: {
        name = hypr.name;
        value = let
          conf = pkgs.writeText "${hypr.name}.conf" (confConverter {
            attrs = import hypr.conf hyprColors;
          });
        in
          import hypr.wrapper ({inherit conf;} // hypr.args);
      }
    )
    hyprs
  )
