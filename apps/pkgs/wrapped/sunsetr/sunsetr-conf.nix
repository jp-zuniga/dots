{pkgs, ...}:
pkgs.writeText "sunsetr.toml" ''
  backend = "auto"
  smoothing = true
  start_hyprsunset = true
  transition_mode = "geo"

  startup_duration = 3
  shutdown_duration = 3

  adaptive_interval = 1
  update_interval = 60

  day_gamma = 100
  day_temp = 6500

  night_gamma = 90
  night_temp = 3250
''
