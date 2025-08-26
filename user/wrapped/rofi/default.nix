{
  pkgs,
  theme,
}: let
  config = import ./rofi-conf.nix {inherit pkgs theme;};
in
  pkgs.symlinkJoin {
    name = "rofi-wrapped";
    paths = [pkgs.rofi-wayland];
    buildInputs = [pkgs.makeWrapper];
    postBuild = ''
      wrapProgram $out/bin/rofi --add-flags "-config ${config}"
      rm $out/share/applications/rofi.desktop
      rm $out/share/applications/rofi-theme-selector.desktop
    '';
  }
