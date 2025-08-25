{
  pkgs,
  theme,
}:
pkgs.symlinkJoin {
  name = "bat-wrapped";
  paths = [pkgs.bat];
  buildInputs = [pkgs.makeWrapper];
  postBuild = ''
    mkdir -p "$($out/bin/bat --config-dir)/themes"
    curl --remote-name-all \
      https://raw.githubusercontent.com/rose-pine/tm-theme/main/dist/themes/rose-pine{,-dawn,-moon}.tmTheme \
      --output-dir $($out/bin/bat --config-dir)/themes --create-dirs
    bat cache --build
    wrapProgram $out/bin/bat --add-flags "--theme=${theme.bat}"
  '';
}
