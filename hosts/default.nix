{
  nixpkgs,
  self,
  ...
}: let
  inherit (self) inputs;
  mkHost = name:
    nixpkgs.lib.nixosSystem {
      modules =
        builtins.attrValues self.nixosModules
        ++ [
          ./${name}
        ];

      specialArgs = {
        inherit inputs;
        flake = self;
        theme = import ../user/theme nixpkgs.legacyPackages.x86_64-linux;
      };
    };
in {
  t14s = mkHost "t14s";
}
