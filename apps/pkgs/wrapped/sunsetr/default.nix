{pkgs, ...}: let
  sunsetrConf = import ./sunsetr-conf.nix pkgs;
in
  pkgs.symlinkJoin {
    name = "sunsetr-wrapped";
    paths = [pkgs.sunsetr];
    buildInputs = [pkgs.makeWrapper];
    postBuild = ''
      wrapProgram $out/bin/sunsetr --add-flags "--config ${sunsetrConf}"
    '';
  }
