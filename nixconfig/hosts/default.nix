{
  nixpkgs,
  self,
  ...
}: let
  inherit (self) inputs;
  mkHost = name: system:
    nixpkgs.lib.nixosSystem {
      modules =
        [
          {
            networking.hostName = name;
            nixpkgs.hostPlatform = system;
          }
          ./${name}
        ]
        ++ builtins.attrValues self.nixosModules;

      # This allows to easily access flake inputs and outputs
      # from nixos modules, so it's a little bit cleaner
      specialArgs = {
        inherit inputs;
        theme = (import ../user).theme nixpkgs.legacyPackages.${system};
        flake = self;
      };
    };
in {
  t14s = mkHost "t14s" "x86_64-linux";
}
