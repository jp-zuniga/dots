{inputs, ...}: {
  imports = [
    ./hardware.nix
    inputs.homix.nixosModules.default
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t14s
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t14s-amd-gen1
  ];

  hardware.laptop.enable = true;
  networking.hostName = "t14s";
  time.timeZone = "America/Managua";
  system.stateVersion = "25.05";
}
