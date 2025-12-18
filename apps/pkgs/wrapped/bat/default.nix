{
  pkgs,
  theme,
  ...
}: let
  batTheme = pkgs.fetchurl {
    url = "https://github.com/rose-pine/tm-theme/blob/main/dist/rose-pine-${theme.rosePineVariant}.tmTheme";
    hash = "sha256-W+ZR6Acd8gDO6nbS0af0ko5eCKkzcMEn+Xg5Hvt88kA=";
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

      mkdir -p "$BAT_CACHE_PATH"
      mkdir -p "$THEME_DIR"

      cp -f ${batTheme} "$THEME_DIR/rose-pine-${theme.rosePineVariant}.tmTheme"

      BAT_CACHE_PATH="$out/share/bat/cache" $out/bin/bat cache --clear
      BAT_CACHE_PATH="$out/share/bat/cache" $out/bin/bat cache --build

      wrapProgram $out/bin/bat --add-flags "--theme=rose-pine-${theme.rosePineVariant}"
    '';
  }
