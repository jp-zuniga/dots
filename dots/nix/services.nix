# system services

{ config, lib, pkgs, ... }:

{
    services = {
        pipewire = {
            alsa = {
                enable       = true;
                support32Bit = true;
            };
            enable       = true;
            pulse.enable = true;
            jack.enable  = true;
        };

        thermald.enable = true;

        tlp = {
            enable   = true;
            settings = {
                CPU_SCALING_GOVERNOR_ON_AC  = "performance";
                CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

                CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
                CPU_ENERGY_PERF_POLICY_ON_AC  = "performance";

                CPU_MIN_PERF_ON_AC  = 0;
                CPU_MAX_PERF_ON_AC  = 100;
                CPU_MIN_PERF_ON_BAT = 0;
                CPU_MAX_PERF_ON_BAT = 60;

                START_CHARGE_THRESH_BAT0 = 40;  # 40% and below, start charging
                STOP_CHARGE_THRESH_BAT0  = 80;  # 80% and above, stop charging
            };
        };
    };
}
