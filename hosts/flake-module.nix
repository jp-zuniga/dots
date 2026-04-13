{
  config,
  inputs,
  ...
}: {
  imports = [
    ./t14s/flake-module.nix
  ];

  flake.lib.mkHost = {
    modules,
    system,
    users,
    ...
  }: let
    pkgs = inputs.nixpkgs.legacyPackages.${system};
  in
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;

      modules = modules ++ [../modules/nixos];

      specialArgs = {
        inherit inputs users;

        inherit (config) flake;

        theme = config.flake.lib.mkTheme {
          inherit (config.flake) lib;
          inherit pkgs;
        };

        unfree-pkgs = import inputs.nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

        unfree-unstable = import inputs.nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
          config.android_sdk.accept_license = true;
        };

        unstable = import inputs.nixpkgs-unstable {inherit system;};
      };
    };
}
