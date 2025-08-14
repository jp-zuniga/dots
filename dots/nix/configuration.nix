#####################
### SYSTEM CONFIG ###
#####################

{
    config,
    pkgs,
    options,
    ...
}: let
    model = "t460";
in {
    imports = [
        ./hardware-configuration.nix
        "${builtins.fetchGit { url = "https://github.com/NixOS/nixos-hardware.git"; }}/lenovo/thinkpad/${model}"

        ./system.nix
        ./services.nix

        ./programs.nix
    ];

    # DO NOT TOUCH!!!
    system.stateVersion = "25.05";
}
