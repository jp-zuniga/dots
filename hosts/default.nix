{self, ...}: let
  inherit (self) inputs;

  mkHost = name:
    inputs.nixpkgs.lib.nixosSystem {
      modules =
        builtins.attrValues self.nixosModules
        ++ [
          ./${name}
        ];

      specialArgs = {
        inherit inputs;
        flake = self;
        theme = import ../theme inputs.nixpkgs.legacyPackages.x86_64-linux;
      };
    };
in {
  t14s = mkHost "t14s";
}
