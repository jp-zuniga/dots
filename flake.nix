{
  description = "rawdogging nix for shits and giggles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
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
