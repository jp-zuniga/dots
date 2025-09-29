{
  conf,
  pkgs,
  theme,
  ...
}:
pkgs.symlinkJoin {
  name = "hypridle-wrapped";
  paths = [pkgs.hypridle];
  buildInputs = [pkgs.makeWrapper];
  postBuild = ''
    wrapProgram $out/bin/hypridle --add-flags "-c ${conf}"
  '';
}
