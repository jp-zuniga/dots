{
  config,
  inputs,
  ...
}: {
  imports = [
    ./hardware.nix
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t14s
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t14s-amd-gen1

    ../../user
  ];

  hardware.laptop.enable = true;
  networking.hostName = "t14s";
  system.stateVersion = "25.05";
}
