{pkgs, ...}: {
  adjust-opacity = pkgs.callPackage ./adjust-opacity pkgs;
  custom-eza = pkgs.callPackage ./custom-eza pkgs;
  focus = pkgs.callPackage ./focus pkgs;
  random-wall = pkgs.callPackage ./random-wall pkgs;
  rebuild = pkgs.callPackage ./rebuild pkgs;
  upgrade = pkgs.callPackage ./upgrade pkgs;
}
