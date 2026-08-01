{
  description = "rawdogging nix for shits and giggles.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:NixOS/nixos-hardware/master";
    };

    flake-parts.url = "github:hercules-ci/flake-parts";

    homix = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:sioodmy/homix";
    };
  };

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux"];
      imports = [
        ./hosts/flake-module.nix
        ./modules/flake-module.nix
        ./theme/flake-module.nix
      ];
    };
}
