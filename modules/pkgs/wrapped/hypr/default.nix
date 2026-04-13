{
  lib,
  pkgs,
  theme,
  ...
}: let
  confConverter = import ./conf-converter.nix {inherit lib;};
  hyprColors = import ./hypr-colors.nix {inherit lib theme;};
  hyprs = [
    {
      args = {};
      conf = ./config/hypridle.nix;
      name = "hypridle-wrapped";
      wrapper = ./bin/hypridle.nix;
    }
    {
      args = {inherit theme;};
      conf = ./config/hyprland.nix;
      name = "hyprlandWrapped";
      wrapper = ./bin/hyprland.nix;
    }
    {
      args = {};
      conf = ./config/hyprlock.nix;
      name = "hyprlock-wrapped";
      wrapper = ./bin/hyprlock.nix;
    }
  ];
in
  builtins.listToAttrs (
    builtins.map (
      hypr: {
        inherit (hypr) name;

        value = let
          conf = pkgs.writeText "${hypr.name}.conf" (confConverter {
            attrs = import hypr.conf {inherit hyprColors;};
          });
        in
          import hypr.wrapper ({inherit conf pkgs;} // hypr.args);
      }
    )
    hyprs
  )
