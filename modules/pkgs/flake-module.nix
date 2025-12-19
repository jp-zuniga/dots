{config, ...}: {
  perSystem = {pkgs, ...}: let
  in {
    packages = let
      theme = config.flake.lib.mkTheme {inherit pkgs;};

      scripts = import ./scripts {inherit pkgs theme;};
      wrapped = import ./wrapped {
        inherit (pkgs) lib;
        inherit pkgs theme;

        users = config.flake.nixosConfigurations.t14s.config.users.users;
      };
    in
      scripts // wrapped;
  };

  flake.nixosModules.pkgs = ./packages.nix;
}
