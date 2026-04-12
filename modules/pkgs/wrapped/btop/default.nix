{
  pkgs,
  theme,
  ...
}: let
  btopConf = import ./btop-conf.nix {inherit pkgs theme;};
in
  pkgs.runCommand "btop-wrapped" {
    nativeBuildInputs = [pkgs.makeWrapper];
  } ''
    mkdir -p $out/bin

    ln -sf ${pkgs.btop}/bin/btop $out/bin/btop

    wrapProgram $out/bin/btop --add-flags "--config ${btopConf}"
  ''
