{
  pkgs,
  theme,
  ...
}: let
  batTheme = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/rose-pine/tm-theme/main/dist/rose-pine-${theme.rosePineVariant}.tmTheme";
    hash = "sha256-yMDEO7RK66V9CzVFvFQj7ZwIvLfFQD6ytes7cbxgh5Y=";
  };
in
  pkgs.symlinkJoin {
    name = "bat-wrapped";
    paths = let
      bextras = pkgs.bat-extras;
    in [
      pkgs.bat
      bextras.batgrep
      bextras.batman
    ];

    buildInputs = [pkgs.makeWrapper];
    postBuild = ''
      export BAT_CONFIG_DIR="$out/share/bat"
      export BAT_CACHE_PATH="$out/share/bat/cache"

      THEME_DIR="$BAT_CONFIG_DIR/themes"

      mkdir -p "$BAT_CACHE_PATH"
      mkdir -p "$THEME_DIR"

      cp -f ${batTheme} "$THEME_DIR/rose-pine-${theme.rosePineVariant}.tmTheme"

      $out/bin/bat cache --clear
      $out/bin/bat cache --build

      wrapProgram $out/bin/bat \
        --add-flags "--theme=rose-pine-${theme.rosePineVariant}" \
        --set BAT_CACHE_PATH "$out/share/bat/cache" \
        --set BAT_CONFIG_DIR "$out/share/bat"
    '';
  }
