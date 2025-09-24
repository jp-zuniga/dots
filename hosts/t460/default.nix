{
  config,
  inputs,
  ...
}: {
  imports = [
    ./hardware.nix
    inputs.homix.nixosModules.default
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t460
  ];

  hardware.laptop.enable = true;
  networking.hostName = "t460";
  system.stateVersion = "25.05";
}
