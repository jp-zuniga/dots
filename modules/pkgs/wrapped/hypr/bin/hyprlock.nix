{
  conf,
  pkgs,
  ...
}:
pkgs.symlinkJoin {
  buildInputs = [pkgs.makeWrapper];
  name = "hyprlock-wrapped";
  paths = [pkgs.hyprlock];
  postBuild = ''
    wrapProgram $out/bin/hyprlock --add-flags "--config ${conf}"
  '';
}
