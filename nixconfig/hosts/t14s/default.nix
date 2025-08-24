{config, ...}: let
  hardware-type = "lenovo/thinkpad";
  hardware-model = "t14s";
in {
  imports = [
    ./hardware.nix
    "${builtins.fetchGit {url = "https://github.com/NixOS/nixos-hardware.git";}}/${hardware-type}/${hardware-model}"
    "${builtins.fetchGit {url = "https://github.com/NixOS/nixos-hardware.git";}}/${hardware-type}/${hardware-model}/amd/gen1"
  ];

  networking.hostName = hardware-model;
  system.stateVersion = "25.05"; ######## !!! DO NOT TOUCH !!!
}
