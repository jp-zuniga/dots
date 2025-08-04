#####################
### SYSTEM CONFIG ###
#####################

{ config, lib, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  system.autoUpgrade = {
    allowReboot = false;
    dates = "06:00";
    enable = true;
    flags = [ "--print-build-logs" ];
    randomizedDelaySec = "30min";
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
    persistent = true;
    randomizedDelaySec = "30min";
  };

  networking.hostName = "ThinkPadT460";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Managua";

  console = {
    keyMap = "us";
  };

  fonts = {
    packages = with pkgs; [ nerd-fonts.meslo-lg ];

    fontconfig = {
      defaultFonts = {
        serif = [ "MesloLGMNerdFontMono" ];
        sansSerif = [ "MesloLGMNerdFontMono" ];
        monospace = [ " MesloLGMNerdFontMono" ];
      };
    };
  };

  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    jack.enable = true;
  };

  users.users.jaq = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [ ];

  programs.firefox.enable = true;
  programs.hyprland.enable = true;
  programs.steam.enable = true;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  hardware.graphics.enable = true;
  hardware.nvidia.modesetting.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    alejandra
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
    hyprshot
    hyprsunset
    hyprswitch
    libnotify
    libreoffice-qt6-fresh
    mako
    microfetch
    mprocs
    mpv
    neovim
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
    uv
    vscode.fhs
    waybar
    xdg-desktop-portal-hyprland
    yazi
  ];

  # programs.mtr.enable = true;

  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
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
