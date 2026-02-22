{
  flake,
  pkgs,
  ...
}: let
  settings = {
    backend = "wayland";

    sunset = "18:30:00";
    sunrise = "09:30:00";
    transition_duration = 60;
    transition_mode = "finish_by";

    smoothing = true;
    startup_duration = 5;
    shutdown_duration = 5;
    adaptive_interval = 1;

    day_gamma = 100;
    day_temp = 6000;

    night_gamma = 90;
    night_temp = 3500;
  };
in
  pkgs.writeText "sunsetr.toml" (flake.lib.toTOML settings)
