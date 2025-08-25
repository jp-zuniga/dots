theme: {
  general = {
    lock_cmd = pidof hyprlock || hyprlock; # avoid starting multiple hyprlock instances
    before_sleep_cmd = loginctl lock-session; # lock before suspend
    after_sleep_cmd = hyprctl dispatch dpms on; # to avoid having to press a key twice to turn on the display
  };

  listener = [
    {
      timeout = 180;
      on-timeout = "brillo -O; brillo -u 500000 -S 10";
      on-resume = "brillo -I -u 250000";
    }
    {
      timeout = 180;
      on-timeout = ''
        current=$(brightnessctl -sd rgb:kbd_backlight get)
        steps=10
        for i in $(seq $steps -1 1); do
          brightnessctl -sd rgb:kbd_backlight set $((current * i / steps)) > /dev/null
          sleep 0.05
        done
      '';
      on-resume = "brightnessctl -rd rgb:kbd_backlight";
    }
    {
      timeout = 300;
      on-timeout = loginctl lock-session;
    }
    {
      timeout = 360;
      on-timeout = hyprctl dispatch dpms off; # screen off when timeout has passed
      on-resume = hyprctl dispatch dpms on && brightnessctl - r; # screen on when activity is detected after timeout has fired.
    }
    {
      timeout = 600;
      on-timeout = systemctl suspend;
    }
  ];
}
