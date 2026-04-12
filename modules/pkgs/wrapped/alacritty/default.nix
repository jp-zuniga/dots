{
  flake,
  pkgs,
  theme,
  ...
}: let
  alacrittyConf = import ./alacritty-conf.nix {inherit flake pkgs theme;};
in
  pkgs.runCommand "alacritty-wrapped" {
    nativeBuildInputs = [pkgs.makeWrapper];
  } ''
    mkdir -p $out/bin

    ln -sf ${pkgs.alacritty}/bin/alacritty $out/bin/alacritty

    wrapProgram $out/bin/alacritty --add-flags "--config-file ${alacrittyConf}"
  ''
