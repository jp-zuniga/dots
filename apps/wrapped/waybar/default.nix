{
  pkgs,
  theme,
  ...
}: let
  waybarConf = import ./waybar-conf.nix pkgs;
  waybarStyle = import ./waybar-style.nix {inherit pkgs theme;};
in
  pkgs.symlinkJoin {
    name = "waybar-wrapped";
    paths = [pkgs.waybar];
    buildInputs = [pkgs.makeWrapper];
    postBuild = ''
      wrapProgram $out/bin/waybar --add-flags "-c ${waybarConf} -s ${waybarStyle}"
    '';
  }
