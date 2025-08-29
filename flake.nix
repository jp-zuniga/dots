{
  description = "rawdogging nix for shits and giggles";

  inputs = {
    firefoxTheme = {
      url = "github:rose-pine/firefox";
      flake = false;
    };

    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    yaziTheme = {
      url = "github:Mintass/rose-pine-moon.yazi";
      flake = false;
    };
  };

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
}
