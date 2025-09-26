{
  pkgs,
  theme,
  ...
}: {
  adjust-opacity = pkgs.callPackage ./adjust-opacity pkgs;
  focus = pkgs.callPackage ./focus pkgs;
  random-wall = pkgs.callPackage ./random-wall pkgs;
  rebuild = pkgs.callPackage ./rebuild pkgs;
  system-cursor = pkgs.callPackage ./system-cursor {inherit pkgs theme;};
  upgrade = pkgs.callPackage ./upgrade pkgs;
}
