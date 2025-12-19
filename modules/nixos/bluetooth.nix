{pkgs, ...}: {
  environment.systemPackages = [pkgs.bluez];
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        AutoEnable = "true";
        Experimental = "true";
      };
    };
  };
}
