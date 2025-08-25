{
  nixpkgs,
  self,
}: let
  inherit (self) inputs;
  mkHost = name: system:
    nixpkgs.lib.nixosSystem {
      modules = [./${name}] ++ builtins.attrValues self.nixosModules;
      specialArgs = {
        inherit inputs;
        flake = self;
      };
    };
in {
  t14s = mkHost "t14s";
}
