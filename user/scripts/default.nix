{pkgs, ...}: {
  focus = pkgs.callPackage ./focus {inherit pkgs;};
  random-wall = pkgs.callPackage ./random-wall {inherit pkgs;};
  rebuild = pkgs.callPackage ./rebuild {inherit pkgs;};
  upgrade = pkgs.callPackage ./upgrade {inherit pkgs;};
}
