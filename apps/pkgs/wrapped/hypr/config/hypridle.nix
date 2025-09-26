hyprColors: {
  general = {
    lock_cmd = "pidof hyprlock || hyprlock";
    before_sleep_cmd = "loginctl lock-session";
    after_sleep_cmd = "hyprctl dispatch dpms on";
  };

  listener = [
    {
      timeout = 180;
      on-timeout = "brillo -O && brillo -u 1000000 -S 0";
      on-resume = "brillo -I -u 1000000";
    }
    {
      timeout = 180;
      on-timeout = "brightnessctl -sd tpacpi::kbd_backlight set 0";
      on-resume = "brightnessctl -rd tpacpi::kbd_backlight";
    }
    {
      timeout = 300;
      on-timeout = "loginctl lock-session";
    }
    {
      timeout = 360;
      on-timeout = "hyprctl dispatch dpms off";
      on-resume = "hyprctl dispatch dpms on && brightnessctl - r";
    }
    {
      timeout = 600;
      on-timeout = "systemctl suspend";
    }
  ];
}
