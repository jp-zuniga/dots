{
  conf,
  pkgs,
  ...
}:
pkgs.symlinkJoin {
  buildInputs = [pkgs.makeWrapper];
  meta.mainProgram = "hyprlock";
  name = "hyprlock-wrapped";
  paths = [pkgs.hyprlock];
  postBuild = ''
    wrapProgram $out/bin/hyprlock --add-flags "--config ${conf}"
  '';
}
