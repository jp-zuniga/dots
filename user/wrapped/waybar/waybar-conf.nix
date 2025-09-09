{pkgs, ...}: let
  settings = {
    layer = "top";
    position = "top";
    name = "main";

    fixed-center = false;

    margin-top = 5;
    margin-left = 5;
    margin-right = 5;

    modules-left = [
      "tray"
      "hyprland/workspaces"
    ];

    modules-center = ["clock"];

    modules-right = [
      "cpu"
      "memory#ram"
      "network#info"
      "pulseaudio#output"
      "backlight"
      "battery"
    ];

    tray = {
      "icon-size" = 16;
      "spacing" = 10;
    };

    "hyprland/workspaces" = {
      format = "{icon}";
    };

    # "hyprland/window" = {
    #   format = "";
    #   icon = true;
    #   icon-size = 16;
    #   tooltip = false;
    # };

    clock = {
      calendar = {
        format = {
          months = "<span color='#f6c177'><b>{}</b></span>";
          today = "<span color='#eb6f92'><b><u>{}</u></b></span>";
          weekdays = "<span color='#ea9a97'><b>{}</b></span>";
        };
      };

      interval = 1;
      format = "{:%H:%M}";
      tooltip-format = "{calendar}";
    };

    # temperature = {
    #   critical-threshold = 60;
    #   interval = 30;
    #   format = "tmp {temperatureC}°";
    #   states = {warning = 75;};
    #   tooltip = false;
    # };

    cpu = {
      interval = 5;
      format = "cpu {usage}%";
      states = {warning = 75;};
      tooltip = false;
    };

    "memory#ram" = {
      interval = 5;
      format = "ram {percentage}%";
      states = {warning = 75;};
      tooltip-format = "Using {used}GB";
    };

    # disk = {
    #   interval = 3000;
    #   format = "dsk {percentage_used}%";
    #   tooltip = "{}";
    #   tooltip-format = "{free}GB free";
    #   states = {warning = 75;};
    # };

    "network#info" = {
      interval = 30;
      format-disconnected = "off";
      format-ethernet = "eth {ifname}";
      format-wifi = "net {signalStrength}%";
      tooltip-format-disconnected = "No network connection active";
      tooltip-format-ethernet = "{ifname}";
      tooltip-format-wifi = "{essid} ({signalStrength}%)";
    };

    # "pulseaudio#input" = {
    #   format = "mic";
    #   max-volume = "100";
    #   tooltip = false;
    # };

    "pulseaudio#output" = {
      format = "vol {volume}%";
      format-muted = "mut";
      tooltip = false;
      scroll-step = 5;
    };

    # "hyprland/language" = {
    #   format = " {}";
    #   tooltip = false;
    #   class = "language";
    # };

    backlight = {
      format = "bri {percent}%";
      scroll-step = 5;
      tooltip = false;
    };

    battery = {
      format = "bat {capacity}%";
      format-charging = "chg {capacity}%";
      format-plugged = "plg {capacity}%";
      format-time = "{H}h {M}m";
      interval = 5;

      states = {
        warning = 40;
        critical = 20;
      };

      tooltip-format-charging = "{timeTo}";
      tooltip-format-discharging = "{timeTo}";
      tooltip-format-plugged = "Plugged in, not charging";
    };
  };
in
  pkgs.writeText "waybar-config.json" (builtins.toJSON settings)
