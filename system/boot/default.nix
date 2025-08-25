{}: {
  boot = {
    bootspec.enable = true;
    consoleLogLevel = 0;
    initrd = {
      verbose = false;
      systemd.enable = true;
    };

    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "rd.udev.log_priority=3"
      "splash"
      "systemd.show_status=auto"
      "quiet"
      "loglevel=3"
      "udev.log_level=3"
      "udev.log_priority=3"
    ];

    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        configurationLimit = 10;
        editor = false;
        enable = true;
      };
    };

    plymouth.enable = true;
    tmp.cleanOnBoot = true;
  };
}
