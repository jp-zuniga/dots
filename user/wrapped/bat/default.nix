{
  pkgs,
  theme,
}: let
  batTheme = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/rose-pine/tm-theme/main/dist/themes/rose-pine${theme.rosePineVariant}.tmTheme";
    hash = "sha256-z/RFwzen1hsGaEh1xEMBHRcI/Zxv5YNcTdd8AgwmwOE=";
  };
in
  pkgs.symlinkJoin {
    name = "bat-wrapped";
    paths = [pkgs.bat];
    buildInputs = [pkgs.makeWrapper];
    postBuild = ''
      mkdir -p "$($out/bin/bat --config-dir)/themes"
      cp -f ${batTheme} "$($out/bin/bat --config-dir)/themes"
      bat cache --build
      wrapProgram $out/bin/bat --add-flags "--theme=rose-pine${theme.rosePineVariant}"
    '';
  }
