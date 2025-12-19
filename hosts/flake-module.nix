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

        flake = config.flake;
        theme = config.flake.lib.mkTheme {inherit pkgs;};

        unfree-unstable = import inputs.nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };

        unstable = import inputs.nixpkgs-unstable {inherit system;};
      };
    };
}
