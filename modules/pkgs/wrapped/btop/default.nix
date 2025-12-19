{
  pkgs,
  theme,
  ...
}: let
  btopConf = import ./btop-conf.nix {inherit pkgs theme;};
in
  pkgs.symlinkJoin {
    name = "btop-wrapped";
    paths = [pkgs.btop];
    buildInputs = [pkgs.makeWrapper];
    postBuild = ''
      wrapProgram $out/bin/btop --add-flags "--config ${btopConf}"
    '';
  }
