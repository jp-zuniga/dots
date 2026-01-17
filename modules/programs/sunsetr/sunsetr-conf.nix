{
  flake,
  pkgs,
  ...
}: let
  settings = {
    backend = "wayland";

    sunset = "18:00:00";
    sunrise = "06:00:00";
    transition_duration = 5;
    transition_mode = "center";

    smoothing = true;
    startup_duration = 3;
    shutdown_duration = 3;
    adaptive_interval = 1;

    day_gamma = 100;
    day_temp = 6500;

    night_gamma = 90;
    night_temp = 3750;
  };
in
  pkgs.writeText "sunsetr.toml" (flake.lib.toTOML settings)
