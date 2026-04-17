{
  conf,
  hyprland ? pkgs.hyprland,
  pkgs,
  theme,
  ...
}: let
  wrapped = pkgs.symlinkJoin {
    buildInputs = [pkgs.makeWrapper];
    name = "hyprlandWrapped";
    paths = [hyprland];
    postBuild = ''
      rm -f $out/bin/Hyprland $out/bin/hyprland

      makeWrapper ${hyprland}/bin/Hyprland $out/bin/hyprland --add-flags "--config ${conf}"
    '';
  };
in
  wrapped
  // {
    inherit (hyprland) version;

    override = args:
      import ./hyprland.nix {
        inherit pkgs conf theme;
        hyprland = hyprland.override args;
      };
  }
