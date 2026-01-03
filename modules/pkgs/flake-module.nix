{config, ...}: {
  perSystem = {pkgs, ...}: let
  in {
    packages = let
      theme = config.flake.lib.mkTheme {inherit pkgs;};

      scripts = import ./scripts {inherit pkgs theme;};
      wrapped = import ./wrapped {
        inherit (config) flake;
        inherit (pkgs) lib;
        inherit pkgs theme;
      };
    in
      scripts // wrapped;
  };

  flake.nixosModules.pkgs = ./packages.nix;
}
