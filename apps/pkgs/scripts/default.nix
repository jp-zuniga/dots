{pkgs, ...}: {
  adjust-opacity = pkgs.callPackage ./adjust-opacity.nix pkgs;
  custom-eza = pkgs.callPackage ./custom-eza.nix pkgs;
  focus = pkgs.callPackage ./focus.nix pkgs;
  random-wall = pkgs.callPackage ./random-wall.nix pkgs;
  rebuild = pkgs.callPackage ./rebuild.nix pkgs;
  upgrade = pkgs.callPackage ./upgrade.nix pkgs;
}
