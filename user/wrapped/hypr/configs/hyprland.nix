hyprColors: let
  mod = "Super";

  fileManager = "yazi";
  menu = "rofi";
  shell = "fish";
  terminal = "alacritty";

  # credits: fufexan
  # binds $mod + [shift/control] {1..10} to [move to] workspace [silent] {1..10}
  workspaces = builtins.concatLists (builtins.genList (
      x: let
        ws = let
          c = (x + 1) / 10;
        in
          builtins.toString (x + 1 - (c * 10));
      in [
        "${mod}, ${ws}, workspace, ${toString (x + 1)}"
        "${mod} SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
        "${mod} ALT, ${ws}, movetoworkspacesilent, ${toString (x + 1)}"
      ]
    )
    10);
in {
  animations = {
    enabled = true;
    animation = [
      "border, 1, 2, default"
      "fade, 1, 4, default"
      "windows, 1, 2, default"
      "workspaces, 1, 3, default, slide"
    ];
  };

  bind =
    workspaces
    ++ [
      "ALT, Tab, cyclenext,"
      "ALT SHIFT, Tab, cyclenext, prev"
      "${mod}, Tab, workspace, previous"

      ", PRINT, exec, hyprshot -m region"
      "SHIFT, PRINT, exec, hyprshot -m active -m window"
      "${mod}, PRINT, exec, hyprshot -m active -m output"

      "ALT SHIFT, W, movefocus, u"
      "ALT SHIFT, A, movefocus, d"
      "ALT SHIFT, S, movefocus, l"
      "ALT SHIFT, D, movefocus, r"
      "ALT CONTROL, W, swapwindow, u"
      "ALT CONTROL, A, swapwindow, d"
      "ALT CONTROL, S, swapwindow, l"
      "ALT CONTROL, D, swapwindow, r"
      "CONTROL SHIFT, W, layoutmsg, orientationtop"
      "CONTROL SHIFT, A, layoutmsg, orientationbottom"
      "CONTROL SHIFT, S, layoutmsg, orientationleft"
      "CONTROL SHIFT, D, layoutmsg, orientationright"

      "${mod}, B, exec, pidof waybar || waybar"
      "${mod} SHIFT, B, exec, ! pidof waybar || pkill waybar"
      "${mod}, C, exec, code"
      "${mod}, E, exec, ${terminal} -e ${shell} -c ${fileManager}"
      "${mod}, F, exec, pidof firefox || firefox"
      "${mod}, L, exec, pidof hyprlock || hyprlock"
      "${mod}, M, exec, focus"
      "${mod}, N, exec, ${terminal} -e ${shell} -c nmtui"
      "${mod}, S, exec, pidof ${menu} || ${menu} -show drun"
      "${mod}, Q, killactive,"
      "${mod}, T, exec, ${terminal}"
      "${mod}, W, exec, random-wall &"
    ];

  bindle = [
    "${mod}, ESCAPE, exit,"
    "${mod}, I, exec, pidof hypridle || hypridle && notify-send 'Hypridle activated!'"
    "${mod} SHIFT, I, exec, ! pidof hypridle || pkill hypridle && notify-send 'Hypridle deactivated!'"
    "${mod} SHIFT, Q, exec, systemctl suspend"

    ", XF86MonBrightnessUp, exec, brightnessctl -n2 set 5%+"
    ", XF86MonBrightnessDown, exec, brightnessctl -n2 set 5%-"

    ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
    ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"

    ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
    ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
  ];

  bindm = [
    "${mod}, mouse:272, movewindow"
    "${mod}, Control_L, movewindow"
    "${mod}, mouse:273, resizewindow"
    "${mod}, ALT_L, resizewindow"
  ];

  debug.disable_logs = false;
  decoration = {
    active_opacity = 1.0;
    inactive_opacity = 0.9;

    blur = {
      enabled = true;
      passes = 1;
      size = 3;
    };

    dim_inactive = true;
    dim_strength = 0.25;

    "shadow:enabled" = false;
    rounding = 5;
    rounding_power = 5;
  };

  dwindle = {
    preserve_split = true;
    pseudotile = true;
  };

  ecosystem = {
    no_update_news = true;
    no_donation_nag = true;
  };

  env = [
    "QT_WAYLAND_DISABLE_WINDOWDECORATION, 1"
  ];

  exec-once = [
    "systemctl --user start hyprpolkitagent &"
    "mako &"
    "hypridle &"
    "swww-daemon &"
    "random-wall &"
    "waybar &"
  ];

  general = {
    allow_tearing = false;
    border_size = 3;
    "col.active_border" = "${hyprColors.iris}";
    "col.inactive_border" = "${hyprColors.muted}";
    gaps_in = 5;
    gaps_out = 5;
    layout = "master";
    resize_on_border = true;
  };

  gestures = {
    workspace_swipe = true;
    workspace_swipe_distance = 200;
    workspace_swipe_invert = 1;
    workspace_swipe_min_speed_to_force = 20;
    workspace_swipe_cancel_ratio = 0.5;
  };

  input = {
    follow_mouse = 1;
    kb_layout = "us";
    sensitivity = 0;
    "touchpad:natural_scroll" = true;
  };

  master = {
    new_status = "master";
  };

  misc = {
    disable_autoreload = true;
    disable_hyprland_logo = true;
    force_default_wallpaper = 0;
    vfr = true;
  };

  monitor = [
    "eDP-1, 1920x1080@60, 0x0, 1"
    ", preferred, auto, 1"
  ];

  windowrule = [
    "nofocus, class:^$, title:^$, xwayland:1, floating:1, fullscreen:0, pinned:0"
    "opacity 1.0,^(jetbrains-.*)$"
    "suppressevent maximize, class:.*"
  ];

  windowrulev2 = ["fullscreenstate 0 3, class:code*"];
  xwayland.force_zero_scaling = true;
}
