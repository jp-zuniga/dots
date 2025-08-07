# base config

{ config, lib, pkgs, ... }:

{
    boot = {
        loader = {
            efi.canTouchEfiVariables = true;
            systemd-boot.enable      = true;
        };
        initrd.verbose  = false;
        kernelPackages  = pkgs.linuxPackages_latest;
        tmp.cleanOnBoot = true;
    };

    nix = {
        gc = {
            automatic = true;
            dates     = "weekly";
            options   = "--delete-older-than 7d";
        };
        nixPath = [
            "nixos-config=/home/jaq/dots/dots/nix/configuration.nix"
            "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos"
            "/nix/var/nix/profiles/per-user/root/channels"
        ];
        settings.auto-optimise-store = true;
    };

    networking = {
        hostName              = "ThinkPadT460";
        networkmanager.enable = true;
    };

    fonts = {
        packages = with pkgs; [ nerd-fonts.jetbrains-mono ];

        fontconfig = {
            defaultFonts  = {
                serif     = [ "JetBrainsMono Nerd Font" ];
                sansSerif = [ "JetBrainsMono Nerd Font" ];
                monospace = [ "JetBrainsMono Nerd Font" ];
            };
        };
    };

    hardware = {
        cpu.amd.updateMicrocode   = lib.mkDefault config.hardware.enableRedistributableFirmware;
        graphics.enable           = true;
        nvidia.modesetting.enable = true;
    };

    security.rtkit.enable = true;

    system.autoUpgrade = {
        allowReboot        = false;
        dates              = "06:00";
        enable             = true;
        flags              = [ "--print-build-logs" ];
        randomizedDelaySec = "30min";
    };

    time.timeZone = "America/Managua";

    users.users.jaq = {
        isNormalUser = true;
        extraGroups  = [ "networkmanager" "wheel" ];
    };

}