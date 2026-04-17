{
  conf,
  pkgs,
  ...
}:
pkgs.symlinkJoin {
  buildInputs = [pkgs.makeWrapper];
  name = "hypridle-wrapped";
  paths = [pkgs.hypridle];
  postBuild = ''
    wrapProgram $out/bin/hypridle --add-flags "--config ${conf}"
  '';
}
