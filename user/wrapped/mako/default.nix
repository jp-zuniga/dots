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
      --font 'mono 12' \
      --border-radius 5 \
      --border-size 3 \
      --padding 10 \
      --background-color '#${theme.bg}' \
      --text-color '#${theme.text}'"
  '';
}
