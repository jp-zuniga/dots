{config, ...}: {
  perSystem = {pkgs, ...}: {
    packages = let
      theme = config.flake.lib.mkTheme {
        inherit (config.flake) lib;
        inherit pkgs;
      };

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
