#####################
### SYSTEM CONFIG ###
#####################

{ config, lib, pkgs, ... }:

{
    imports = [
        ./hardware-configuration.nix

        ./system.nix
        ./services.nix

        ./programs.nix
    ];

    # DO NOT TOUCH!!!
    system.stateVersion = "25.05";
}
