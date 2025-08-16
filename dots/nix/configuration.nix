#####################
### SYSTEM CONFIG ###
#####################

{ config, lib, pkgs, ... }: let
    current-hardware = "lenovo/thinkpad/t460";
in {
    imports = [
        ./hardware-configuration.nix
        "${builtins.fetchGit { url = "https://github.com/NixOS/nixos-hardware.git"; }}/${current-hardware}"

        ./system.nix
        ./services.nix

        ./programs.nix
    ];

    system.stateVersion = "25.05";  # DO NOT TOUCH!!!
}
