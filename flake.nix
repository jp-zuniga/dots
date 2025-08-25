{
  description = "rawdogging nix for shits and giggles";

  outputs = inputs @ {nixpkgs, ...}: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
    user = import ./user pkgs;
  in {
    packages.x86_64-linux = user.packages;
    formatter.x86_64-linux = pkgs.alejandra;

    nixosModules =
      {
        system = import ./system;
        user = user.module;
      }
      // import ./modules;

    nixosConfigurations = import ./hosts inputs;
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
  };
}
