{
  conf,
  pkgs,
  theme,
  hyprland ? pkgs.hyprland,
  ...
}: let
  wrapped = pkgs.symlinkJoin {
    name = "hyprlandWrapped";
    paths = [
      hyprland
      pkgs.brightnessctl
      pkgs.brillo
      pkgs.hyprpicker
      pkgs.hyprshot
      pkgs.libnotify
      pkgs.playerctl
      pkgs.swww
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
    inherit (hyprland) version;

    override = args:
      import ./hyprland.nix {
        inherit pkgs conf theme;
        hyprland = hyprland.override args;
      };
  }
