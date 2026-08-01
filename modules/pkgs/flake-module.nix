{
  config,
  inputs,
  ...
}: {
  perSystem = {
    pkgs,
    system,
    ...
  }: {
    packages = let
      theme = config.flake.lib.mkTheme {
        inherit (config.flake) lib;
        inherit pkgs;
      };

      scripts = import ./scripts {inherit pkgs theme;};
      unstable = import inputs.nixpkgs-unstable {inherit system;};
      wrapped = import ./wrapped {
        inherit (config) flake;
        inherit (pkgs) lib;
        inherit pkgs theme unstable;
      };
    in
      scripts // wrapped;
  };

  flake.nixosModules.pkgs = ./packages.nix;
}
