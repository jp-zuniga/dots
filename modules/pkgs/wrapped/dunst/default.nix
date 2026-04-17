{
  pkgs,
  theme,
  ...
}: let
  dunstConf = import ./dunst-conf.nix {
    inherit (theme) colors;
    inherit pkgs;
  };
in
  pkgs.symlinkJoin {
    buildInputs = [pkgs.makeWrapper];
    name = "dunst-wrapped";
    paths = [pkgs.dunst];
    postBuild = ''
      wrapProgram $out/bin/dunst --add-flags "-config ${dunstConf}"
    '';
  }
