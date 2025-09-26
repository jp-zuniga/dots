{
  lib,
  pkgs,
  theme,
  unstable,
  ...
}: let
  confConverter = import ./conf-converter.nix lib;
  hyprColors = import ./hypr-colors.nix {inherit lib theme;};
  wraps = [
    {
      name = "hypridle-wrapped";
      confFile = ./config/hypridle.nix;
      binFile = ./bin/hypridle.nix;
      extraArgs = {inherit pkgs theme;};
    }
    {
      name = "hyprland-wrapped";
      confFile = ./config/hyprland.nix;
      binFile = ./bin/hyprland.nix;
      extraArgs = {
        inherit theme;
        pkgs = unstable;
      };
    }
    {
      name = "hyprlock-wrapped";
      confFile = ./config/hyprlock.nix;
      binFile = ./bin/hyprlock.nix;
      extraArgs = {inherit pkgs theme;};
    }
  ];
in
  builtins.listToAttrs (
    builtins.map (wrap: {
      name = wrap.name;
      value = let
        conf = pkgs.writeText "${wrap.name}.conf" (confConverter {
          attrs = import wrap.confFile hyprColors;
        });
      in
        import wrap.binFile ({inherit conf;} // wrap.extraArgs);
    })
    wraps
  )
