{
  pkgs,
  theme,
  ...
}: let
  config = import ./rofi-conf.nix {inherit pkgs theme;};
  rofi = pkgs.rofi-unwrapped;
in
  pkgs.runCommand "rofi-wrapped" {
    nativeBuildInputs = [pkgs.makeWrapper];
  } ''
    mkdir -p $out/bin
    mkdir -p $out/share

    ln -sf ${rofi}/bin/rofi $out/bin/rofi
    ln -sf ${rofi}/share/rofi $out/share/rofi
    ln -sf ${rofi}/share/icons $out/share/icons

    wrapProgram $out/bin/rofi --add-flags "-config ${config}"
  ''
