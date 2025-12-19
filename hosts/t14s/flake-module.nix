{config, ...}: {
  flake.nixosConfigurations.t14s = config.flake.lib.mkHost {
    modules = [./configuration.nix];
    system = "x86_64-linux";

    users.jaq = {
      extraGroups = [
        "libvirtd"
        "networkmanager"
        "wheel"
      ];

      home = "/home/jaq";
      name = "jaq";
    };
  };
}
