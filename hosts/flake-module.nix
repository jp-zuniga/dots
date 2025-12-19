{
  inputs,
  config,
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
  }:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system modules;

      specialArgs = {
        inherit inputs users;
        flake = config.flake;
        theme = config.flake.lib.mkTheme {
          pkgs = inputs.nixpkgs.legacyPackages.${system};
        };
      };
    };
}
