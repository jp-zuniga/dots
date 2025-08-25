{config}: {
  imports = [
    ./hardware.nix
    "${builtins.fetchGit {url = "https://github.com/NixOS/nixos-hardware.git";}}/lenovo/thinkpad/t14s"
    "${builtins.fetchGit {url = "https://github.com/NixOS/nixos-hardware.git";}}/lenovo/thinkpad/t14s/amd/gen1"
  ];

  hardware.laptop.enable = true;
  networking.hostName = "t14s";
  system.stateVersion = "25.05";
}
