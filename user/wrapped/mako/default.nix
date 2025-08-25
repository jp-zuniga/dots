{
  pkgs,
  theme,
}:
pkgs.symlinkJoin {
  name = "mako-wrapped";
  paths = [pkgs.mako];
  buildInputs = [pkgs.makeWrapper];
  postBuild = ''
    wrapProgram $out/bin/mako --add-flags "\
    --font 'monospace 12' \
    --border-radius 5 \
    --border-size 3 \
    --padding 10 \
    --background-color '#${theme.overlay}' \
    --border-color '#${theme.highlightHigh}' \
    --progress-color '#${theme.pine}' \
    --text-color '#${theme.text}' \
  '';
}
