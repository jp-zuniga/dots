{
  pkgs,
  theme,
  ...
}: let
  inherit (pkgs) callPackage;
in {
  adjust-opacity = callPackage ./adjust-opacity.nix {inherit pkgs;};
  cza = callPackage ./cza.nix {inherit pkgs;};
  focus = callPackage ./focus.nix {inherit pkgs theme;};
  get-kb = callPackage ./get-kb.nix {inherit pkgs;};
  random-wall = callPackage ./random-wall.nix {inherit pkgs theme;};
  rebuild = callPackage ./rebuild.nix {inherit pkgs;};
  switch-kb = callPackage ./switch-kb.nix {inherit pkgs;};
  upgrade = callPackage ./upgrade.nix {inherit pkgs;};
}
