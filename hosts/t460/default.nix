{inputs, ...}: {
  imports = [
    ./hardware.nix
    inputs.homix.nixosModules.default
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t460
    ../../apps
  ];

  hardware.laptop.enable = true;
  networking.hostName = "t460";
  nixpkgs.hostPlatform = "x86_64-linux";
  system.stateVersion = "25.05";
}
