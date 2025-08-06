#####################
### SYSTEM CONFIG ###
#####################

{ config, lib, pkgs, ... }:

{
    imports = [ ./hardware-configuration.nix ];

    boot = {
        loader = {
            efi.canTouchEfiVariables = true;
            systemd-boot.enable      = true;
        };
        initrd.verbose  = false;
        kernelPackages  = pkgs.linuxPackages_latest;
        tmp.cleanOnBoot = true;
    };

    system.autoUpgrade = {
        allowReboot        = false;
        dates              = "06:00";
        enable             = true;
        flags              = [ "--print-build-logs" ];
        randomizedDelaySec = "30min";
    };

    nix = {
        gc = {
            automatic = true;
            dates     = "weekly";
            options   = "--delete-older-than 7d";
        };
        settings.auto-optimise-store = true;
    };

    networking.hostName              = "ThinkPadT460";
    networking.networkmanager.enable = true;

    time.timeZone = "America/Managua";

    fonts = {
        packages = with pkgs; [ nerd-fonts.jetbrains-mono ];

        fontconfig = {
            defaultFonts  = {
                serif     = [ "JetBrainsMono Nerd Font" ];
                sansSerif = [ "JetBrainsMono Nerd Font" ];
                monospace = [ " JetBrainsMono Nerd Font" ];
            };
        };
    };

    # hardware.bluetooth.enable          = true;
    hardware.graphics.enable           = true;
    hardware.nvidia.modesetting.enable = true;

    security.rtkit.enable = true;

    services.pipewire = {
        alsa = {
            enable       = true;
            support32Bit = true;
        };
        enable       = true;
        pulse.enable = true;
        jack.enable  = true;
    };

    users.users.jaq = {
        isNormalUser = true;
        extraGroups  = [ "networkmanager" "wheel" ];
    };

    programs.nix-ld.enable    = true;
    programs.nix-ld.libraries = with pkgs; [ ];

    programs.firefox.enable  = true;
    programs.hyprland.enable = true;
    programs.steam.enable    = true;

    nixpkgs.config.allowUnfree  = true;
    environment.defaultPackages = [ ];

    environment.systemPackages  = with pkgs; [
        alacritty
        astroterm
        bacon
        bat
        brightnessctl
        btop
        cbonsai
        delta
        discord
        eza
        gimp3
        git
        hyprcursor
        hypridle
        hyprlock
        hyprpicker
        hyprpolkitagent
        hyprshot
        hyprsunset
        libnotify
        mako
        microfetch
        mprocs
        mpv
        ncspot
        nushell
        pastel
        rofi-wayland
        rustup
        sccache
        spotify
        starship
        swww
        qbittorrent
        qview
        rose-pine-cursor
        rose-pine-hyprcursor
        tokei
        udiskie
        uv
        vscode.fhs
        waybar
        xdg-desktop-portal-hyprland
        yazi
    ];

    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    # programs.mtr.enable = true;

    # programs.gnupg.agent = {
    #     enable           = true;
    #     enableSSHSupport = true;
    # };

    # Enable the OpenSSH daemon.
    # services.openssh.enable = true;

    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];

    # Or disable the firewall altogether.
    # networking.firewall.enable = false;

    # Copy the NixOS configuration file and link it from the resulting system.
    # system.copySystemConfiguration = true;

    # DO NOT TOUCH!!!
    system.stateVersion = "25.05";
}
