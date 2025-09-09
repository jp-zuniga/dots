{
  pkgs,
  theme,
}: let
  alacrittyConf = import ./alacritty-conf.nix {inherit pkgs theme;};
in
  pkgs.symlinkJoin {
    name = "alacritty-wrapped";
    paths = [pkgs.alacritty];
    buildInputs = [pkgs.makeWrapper];
    postBuild = ''
      wrapProgram $out/bin/alacritty --add-flags "--config-file ${alacrittyConf}"
    '';
  }
