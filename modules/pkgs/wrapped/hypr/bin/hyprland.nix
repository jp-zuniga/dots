{
  conf,
  pkgs,
  theme,
  hyprland ? pkgs.hyprland,
  ...
}: let
  wrapped = pkgs.symlinkJoin {
    name = "hyprland-wrapped";
    paths = [
      hyprland
      pkgs.brightnessctl
      pkgs.brillo
      pkgs.hyprshot
      pkgs.libnotify
      pkgs.playerctl
      pkgs.swww
      theme.cursor.hypr.package
    ];

    buildInputs = [pkgs.makeWrapper];
    postBuild = ''
      rm -f $out/bin/Hyprland $out/bin/hyprland

      makeWrapper ${hyprland}/bin/Hyprland $out/bin/hyprland --add-flags "--config ${conf}"
    '';
  };
in
  wrapped
  // {
    override = args:
      import ./hyprland.nix {
        inherit pkgs conf theme;
        hyprland = hyprland.override args;
      };

    version = hyprland.version;
  }
