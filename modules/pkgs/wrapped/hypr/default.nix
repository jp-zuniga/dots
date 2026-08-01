{
  lib,
  pkgs,
  theme,
  ...
}: let
  confConverter = import ./conf-converter.nix {inherit lib;};
  hyprColors = import ./hypr-colors.nix {inherit lib theme;};

  confHyprs = [
    {
      args = {};
      conf = ./config/hypridle.nix;
      name = "hypridle-wrapped";
      wrapper = ./bin/hypridle.nix;
    }
    {
      args = {};
      conf = ./config/hyprlock.nix;
      name = "hyprlock-wrapped";
      wrapper = ./bin/hyprlock.nix;
    }
  ];

  hyprlandLua = pkgs.writeText "hyprland-wrapped.lua" (
    import ./config/hyprland.nix {inherit hyprColors;}
  );

  hyprlandPkg = import ./bin/hyprland.nix {
    conf = hyprlandLua;
    inherit pkgs theme;
  };
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
    confHyprs
  )
  // {
    "hyprland-wrapped" = hyprlandPkg;
  }
