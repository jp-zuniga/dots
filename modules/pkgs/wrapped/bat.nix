{
  pkgs,
  theme,
  ...
}: let
  name = builtins.replaceStrings [" "] ["%20"] theme.name;

  batTheme = pkgs.fetchurl {
    hash = "sha256-OVVm8IzrMBuTa5HAd2kO+U9662UbEhVT8gHJnCvUqnc=";
    url = "${theme.rawGithub}/bat/main/themes/${name}.tmTheme";
  };
in
  pkgs.symlinkJoin {
    buildInputs = [pkgs.makeWrapper];
    name = "bat-wrapped";
    paths = [
      pkgs.bat
      pkgs.bat-extras.batman
    ];

    postBuild = ''
      export BAT_CONFIG_DIR="$out/share/bat"
      export BAT_CACHE_PATH="$out/share/bat/cache"

      THEME_DIR="$BAT_CONFIG_DIR/themes"

      mkdir -p "$BAT_CACHE_PATH"
      mkdir -p "$THEME_DIR"

      cp -f ${batTheme} "$THEME_DIR/${theme.kebabName}.tmTheme"

      $out/bin/bat cache --clear
      $out/bin/bat cache --build

      wrapProgram $out/bin/bat \
        --add-flags "--theme=${theme.kebabName}" \
        --set BAT_CACHE_PATH "$out/share/bat/cache" \
        --set BAT_CONFIG_DIR "$out/share/bat"
    '';
  }
