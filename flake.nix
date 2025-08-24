{
  description = "rawdogging nix for shits and giggles";

  outputs = inputs @ {nixpkgs, ...}: let
    user = import ./user;
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    packages = user.packages pkgs;
    formatter = pkgs.alejandra;
    devShells.default = user.shell pkgs;
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
