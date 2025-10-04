{
  description = "rawdogging nix for shits and giggles";

  inputs = {
    homix = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:sioodmy/homix";
    };

    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    spicetify-nix = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:Gerg-L/spicetify-nix";
    };

    yaziTheme = {
      url = "github:Mintass/rose-pine-moon.yazi";
      flake = false;
    };
  };

  outputs = inputs @ {self, ...}: {
    nixosConfigurations = import ./hosts inputs;
    nixosModules =
      import ./modules
      // {
        system = import ./system;
      };
  };
}
