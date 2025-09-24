{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    hardware.laptop.enable = lib.mkEnableOption "Enable laptop-specific configuration.";
  };

  config = lib.mkIf config.hardware.laptop.enable {
    services = {
      thermald.enable = true;
      tlp = {
        enable = true;
        settings = {
          CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
          CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
          CPU_SCALING_GOVERNOR_ON_AC = "performance";
          CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

          CPU_MAX_PERF_ON_AC = 100;
          CPU_MAX_PERF_ON_BAT = 50;
          CPU_MIN_PERF_ON_AC = 0;
          CPU_MIN_PERF_ON_BAT = 0;

          START_CHARGE_THRESH_BAT0 = 40;
          STOP_CHARGE_THRESH_BAT0 = 90;
        };
      };
    };
  };
}
