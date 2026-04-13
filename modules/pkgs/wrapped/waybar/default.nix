{
  pkgs,
  theme,
  ...
}: let
  waybarConf = import ./waybar-conf.nix {inherit pkgs theme;};
  waybarStyle = import ./waybar-style.nix {inherit pkgs theme;};
in
  pkgs.symlinkJoin {
    name = "waybar-wrapped";
    paths = [pkgs.waybar];
    buildInputs = [pkgs.makeWrapper];
    postBuild = ''
      wrapProgram $out/bin/waybar --add-flags "--config ${waybarConf} --style ${waybarStyle}"
    '';
  }
