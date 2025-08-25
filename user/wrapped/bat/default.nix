{
  pkgs,
  theme,
}: let
  batTheme = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/rose-pine/tm-theme/main/dist/themes/${theme.rosePineVariant}.tmTheme";
    # hash = "sha256-1qf04q604z6p9mf87rbgkkyhh5qx051w8xa8d031pmm76z1lbx6g";
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
      wrapProgram $out/bin/bat --add-flags "--theme=${theme.rosePineVariant}"
    '';
  }
