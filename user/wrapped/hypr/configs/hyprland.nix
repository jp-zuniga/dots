theme: let
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
    [
      # tabbing between stuff
      "ALT, Tab, cyclenext,"
      "ALT SHIFT, Tab, cyclenext, prev"
      "SUPER, Tab, workspace, previous"

      # screenshots
      ", PRINT, exec, hyprshot -m region"
      "SHIFT, PRINT, exec, hyprshot -m active -m window"
      "SUPER, PRINT, exec, hyprshot -m active -m output"

      # quit to tty
      "SUPER, ESCAPE, exit,"

      # window controls
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

      "SUPER, B, exec, ! pidof waybar || waybar"
      "SUPER SHIFT, B, exec, pidof waybar || kill $(pgrep waybar)"
      "SUPER, C, exec, code"
      "SUPER, E, exec, ${terminal} -e ${shell} -c ${fileManager}"
      "SUPER, F, exec, firefox"
      "SUPER, L, exec, hyprlock"
      "SUPER, M, exec, ~/dots/scripts/focus.sh"
      "SUPER, N, exec, ${terminal} -e ${shell} -c nmtui"
      "SUPER, S, exec, ${menu} -show drun"
      "SUPER, Q, killactive,"
      "SUPER SHIFT, Q, exec, systemctl suspend"
      "SUPER, T, exec, ${terminal}"
      "SUPER, W, exec, ~/dots/scripts/random-wall.sh"
    ]
    ++ workspaces;

  # bindl = [
  #   # media controls
  #   ", XF86AudioPlay, exec, playerctl play-pause"
  #   ", XF86AudioPrev, exec, playerctl previous"
  #   ", XF86AudioNext, exec, playerctl next"

  #   # volume
  #   ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
  #   ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
  # ];

  bindle = [
    # backlight
    ", XF86MonBrightnessUp,   exec, brightnessctl -n2 set 5%+"
    ", XF86MonBrightnessDown, exec, brightnessctl -n2 set 5%-"

    # volume
    ", XF86AudioRaiseVolume,  exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
    ", XF86AudioLowerVolume,  exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
    ", XF86AudioMute,         exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
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
    inactive_opacity = 0.8;

    "shadow:enabled" = false;
    blur = {
      enabled = true;
      passes = 1;
      size = 3;
    };

    rounding = 5;
    rounding_power = 5;
  };

  dwindle = {
    pseudotile = true;
    preserve_split = true;
  };

  ecosystem = {
    no_update_news = true;
    no_donation_nag = true;
  };

  env = [
    "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
  ];

  exec-once = [
    "mako &"
    "hypridle &"
    "swww-daemon &"
    "systemctl --user start hyprpolkitagent &"

    "~/dots/scripts/random-wall.sh" # set random wallpaper on hyprland boot
  ];

  general = {
    allow_tearing = false;
    border_size = 3;
    "col.active_border" = "rgb(${theme.iris})";
    "col.inactive_border" = "rgb(${theme.surface})";
    gaps_in = 5;
    gaps_out = 5;
    layout = "dwindle";
    resize_on_border = true;
  };

  gestures = {
    workspace_swipe = false;
  };

  input = {
    follow_mouse = 1;
    kb_layout = "us";
    kb_variant = "qwerty,";
    kb_options = "caps:escape";
    sensitivity = 0;
    "touchpad:natural_scroll" = true;
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
    "suppressevent maximize, class:.*"
    "nofocus, class:^$, title:^$, xwayland:1, floating:1, fullscreen:0, pinned:0"
  ];

  windowrulev2 = ["fullscreenstate 0 3, class:code*"];
  xwayland.force_zero_scaling = true;
}
