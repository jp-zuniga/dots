{
  pkgs,
  theme,
}: let
  config = import ./rofi-conf.nix {inherit pkgs theme;};
  rofiWithoutDesktop = pkgs.rofi-wayland.overrideAttrs (oldAttrs: {
    postBuild =
      (oldAttrs.postBuild or "")
      + ''
        rm -rf $out/share/applications
      '';

    postInstall =
      (oldAttrs.postInstall or "")
      + ''
        rm -rf $out/share/applications
      '';
  });
in
  pkgs.symlinkJoin {
    name = "rofi-wrapped";
    paths = [rofiWithoutDesktop];
    buildInputs = [pkgs.makeWrapper];
    postBuild = ''
      wrapProgram $out/bin/rofi --add-flags "-config ${config}"
      rm -rf $out/share/applications
    '';

    postInstall = ''
      rm -rf $out/share/applications
    '';
  }
