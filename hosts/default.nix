{
  nixpkgs,
  self,
}: let
  inherit (self) inputs;
  mkHost = name:
    nixpkgs.lib.nixosSystem {
      modules = [./${name}] ++ builtins.attrValues self.nixosModules;
      specialArgs = {
        inherit inputs;
        flake = self;
        theme = import ../user/theme nixpkgs.legacyPackages.x86_64-linux;
      };
    };
in {
  t14s = mkHost "t14s";
}
