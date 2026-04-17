{
  pkgs,
  theme,
  ...
}: let
  waybarConf = import ./waybar-conf.nix {inherit pkgs theme;};
  waybarStyle = import ./waybar-style.nix {inherit pkgs theme;};
in
  pkgs.symlinkJoin {
    buildInputs = [pkgs.makeWrapper];
    name = "waybar-wrapped";
    paths = [pkgs.waybar];
    postBuild = ''
      wrapProgram $out/bin/waybar --add-flags "--config ${waybarConf} --style ${waybarStyle}"
    '';
  }
