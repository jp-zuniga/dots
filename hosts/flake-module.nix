{
  inputs,
  config,
  ...
}: {
  imports = [
    ./t14s/flake-module.nix
  ];

  flake.lib.mkHost = {
    system,
    modules,
    ...
  }:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;

      modules = modules ++ [../../apps];

      specialArgs = {
        inherit inputs;
        flake = config.flake;
        theme = config.flake.lib.mkTheme {
          pkgs = inputs.nixpkgs.legacyPackages.${system};
        };
      };
    };
}
