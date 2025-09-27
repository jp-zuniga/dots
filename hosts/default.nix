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
        theme = import ../theme inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
      };
    };
in {
  t14s = mkHost "t14s";
}
