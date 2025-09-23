{
  config,
  inputs,
  ...
}: {
  imports = [
    # ./hardware.nix
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t460
  ];

  hardware.laptop.enable = true;
  networking.hostName = "t460";
  system.stateVersion = "25.05";
}
