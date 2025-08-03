#####################
### SYSTEM CONFIG ###
#####################

{ config, lib, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
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
    randomizedDelaySec = "30min";
    persistent = true;
  };

  networking.hostName = "ThinkPadT460";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Managua";

  console = {
    keyMap = "us";
  };

  fonts = {
    packages = with pkgs; [
      liberation_ttf
      nerd-fonts.meslo-lg
    ];

    fontconfig = {
      defaultFonts = {
        serif = [ "Liberation Serif" ];
        sansSerif = [ "MesloLGMNerdFont" ];
        monospace = [ " MesloLGMNerdFont-Mono" ];
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
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      ms-python.python
      ms-python.debugpy
      ms-python.vscode-pylance
      charliemarsh.ruff
      rust-lang.rust-analyzer
      tamasfe.even-better-toml
      aaron-bond.better-comments
      karyfoundation.theme-karyfoundation-themes
      TheNuProjectContributors.vscode-nushell-lang
    ];
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  hardware.graphics.enable = true;
  hardware.nvidia.modesetting.enable = true;

  nixpkgs.config.allowUnfree = true;

  # Packages!
  environment.systemPackages = with pkgs; [
    alacritty
    astroterm
    bacon
    brightnessctl
    bat
    cbonsai
    delta
    discord
    eza
    gimp3
    git
    hyprcursor
    hypridle
    hyprlock
    hyprpaper
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
    networkmanagerapplet
    nushell
    pastel
    rofi-wayland
    rustup
    sccache
    starship
    qbittorrent
    qview
    tokei
    uv
    waybar
    xdg-desktop-portal-hyprland
    (yazi.override {
      _7zz = _7zz-rar;
    })
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
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
