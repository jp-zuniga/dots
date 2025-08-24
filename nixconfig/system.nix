# base config
{
  config,
  lib,
  pkgs,
  ...
}: {
  # boot = {
  #   bootspec.enable = true;
  #   consoleLogLevel = 0;
  #   initrd.verbose = false;
  #   kernelPackages = pkgs.linuxPackages_latest;
  #   kernelParams = [
  #     "rd.systemd.show_status=false"
  #     "rd.udev.log_level=3"
  #     "rd.udev.log_priority=3"
  #     "splash"
  #     "systemd.show_status=auto"
  #     "quiet"
  #     "loglevel=3"
  #     "udev.log_level=3"
  #     "udev.log_priority=3"
  #   ];

  #   loader = {
  #     efi.canTouchEfiVariables = true;

  #     systemd-boot = {
  #       editor = false;
  #       enable = true;
  #     };
  #   };

  #   plymouth.enable = true;
  #   tmp.cleanOnBoot = true;
  # };

  fonts = {
    packages = with pkgs; [nerd-fonts.jetbrains-mono];
    fontconfig = {
      defaultFonts = {
        serif = ["JetBrainsMono Nerd Font"];
        sansSerif = ["JetBrainsMono Nerd Font"];
        monospace = ["JetBrainsMono Nerd Font"];
      };
    };
  };

  # hardware.graphics.enable = true;

  # nix = {
    # disabled to avoid conflicts with nh.clean
    # gc = {
    #     automatic = true;
    #     dates     = "weekly";
    #     options   = "--delete-older-than 7d";
    # };

  #   settings = {
  #     auto-optimise-store = true;
  #     experimental-features = ["nix-command"];
  #   };
  # };

  # nixpkgs.config.allowUnfree = true;
  # networking.networkmanager.enable = true;

  # programs.nix-ld = {
  #   enable = true;
  #   libraries = with pkgs; [];
  # };

  security.rtkit.enable = true;
  system.autoUpgrade = {
    allowReboot = false;
    dates = "06:00";
    enable = true;
    flags = ["--print-build-logs"];
    randomizedDelaySec = "30min";
  };

  # time.timeZone = "America/Managua";

  # users.defaultUserShell = pkgs.fish;
  # users.users.jaq = {
  #   isNormalUser = true;
  #   extraGroups = ["networkmanager" "wheel"];
  # };
}
