{
  conf,
  pkgs,
  ...
}:
pkgs.symlinkJoin {
  name = "hyprlock-wrapped";
  paths = [pkgs.hyprlock];
  buildInputs = [pkgs.makeWrapper];
  postBuild = ''
    wrapProgram $out/bin/hyprlock --add-flags "--config ${conf}"
  '';
}
