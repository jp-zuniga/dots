{
  flake,
  pkgs,
  theme,
  unstable,
  ...
}: let
  wifituiTheme = import ./wifitui-theme.nix {
    inherit (theme) colors;
    inherit flake pkgs;
  };
in
  pkgs.symlinkJoin {
    buildInputs = [pkgs.makeWrapper];
    name = "wifitui-wrapped";
    paths = [unstable.wifitui];
    postBuild = ''
      wrapProgram $out/bin/wifitui --add-flags "--theme=${wifituiTheme}"
    '';
  }
