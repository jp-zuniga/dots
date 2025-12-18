{config, ...}: {
  flake.nixosConfigurations.t14s = config.flake.lib.mkHost {
    system = "x86_64-linux";
    modules = [./default.nix];
  };
}
