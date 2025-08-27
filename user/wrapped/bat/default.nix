{
  pkgs,
  theme,
  ...
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
      export BAT_CONFIG_DIR="$out/share/bat"
      export BAT_CACHE_PATH="$out/share/bat/cache"
      THEME_DIR="$BAT_CONFIG_DIR/themes"

      mkdir -p "$THEME_DIR"
      mkdir -p "$BAT_CACHE_PATH"
      cp -f ${batTheme} "$THEME_DIR/rose-pine${theme.rosePineVariant}.tmTheme"

      BAT_CACHE_PATH="$BAT_CACHE_PATH" $out/bin/bat cache --build
      wrapProgram $out/bin/bat --add-flags "--theme=rose-pine${theme.rosePineVariant}"
    '';
  }
