{
  pkgs,
  theme,
  ...
}: let
  dunstrc = pkgs.writeText "dunstrc" ''
    [global]
    font = mono 12
    width = 500
    padding = 10
    frame_width = 3
    corner_radius = 5
    background = "${theme.colors.base}"
    foreground = "${theme.colors.white}"
    frame_color = "${theme.colors.black}"
  '';
in
  pkgs.symlinkJoin {
    name = "dunst-wrapped";
    paths = [pkgs.dunst];
    buildInputs = [pkgs.makeWrapper];
    postBuild = ''
      wrapProgram $out/bin/dunst --add-flags "-config ${dunstrc}"
    '';
  }
