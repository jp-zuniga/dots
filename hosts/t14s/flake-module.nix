{config, ...}: {
  flake.nixosConfigurations.t14s = config.flake.lib.mkHost {
    modules = [
      ./configuration.nix

      ../../modules/nixos/laptop.nix
      ../../modules/pkgs/packages.nix
      ../../modules/programs
    ];

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
