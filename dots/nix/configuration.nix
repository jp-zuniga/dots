# import all configs

{ config, lib, pkgs, ... }: let
    hardware-type  = "lenovo/thinkpad";
    hardware-model = "t460";
in {
    imports = [
        ./hardware-configuration.nix
        "${builtins.fetchGit { url = "https://github.com/NixOS/nixos-hardware.git"; }}/${hardware-type}/${hardware-model}"

        ./system.nix
        ./services.nix

        ./programs.nix
    ];

    networking.hostName = hardware-model;
    system.stateVersion = "25.05";  ######## !!! DO NOT TOUCH !!!
}
