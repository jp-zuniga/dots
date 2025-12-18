{pkgs, ...}: {
  adjust-opacity = pkgs.callPackage ./adjust-opacity.nix pkgs;
  cza = pkgs.callPackage ./cza.nix pkgs;
  focus = pkgs.callPackage ./focus.nix pkgs;
  get-kb = pkgs.callPackage ./get-kb.nix pkgs;
  random-wall = pkgs.callPackage ./random-wall.nix pkgs;
  rebuild = pkgs.callPackage ./rebuild.nix pkgs;
  switch-kb = pkgs.callPackage ./switch-kb.nix pkgs;
  upgrade = pkgs.callPackage ./upgrade.nix pkgs;
}
