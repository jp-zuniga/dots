{hyprColors, ...}: let
  mod = "Super";

  menu = "rofi";
  shell = "fish";
  term = "alacritty";

  # - author: https://github.com/sioodmy
  # - source: https://github.com/sioodmy/dotfiles/blob/15ff23fc19cff8a5e4903bf95e93be025520c6b5/user/wrapped/hypr/tohyprconf.nix
  #
  # - license:
  #   - GPLv3
  #     - https://github.com/sioodmy/dotfiles/blob/15ff23fc19cff8a5e4903bf95e93be025520c6b5/LICENSE
  #
  # - original attribution:
  #   - credits: fufexan
  #     - binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
  #
  # - changes:
  #   - added "$mod + ALT" bind (that i NEVER use! :D)
  #
  # ---------------------------------------------------------------------------------------
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
  # ---------------------------------------------------------------------------------------
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

      "${mod}, PRINT, exec, hyprshot -m active -m output -o ~/pics/ss"
      "SHIFT, PRINT, exec, hyprshot -m active -m window -o ~/pics/ss"
      ", PRINT, exec, hyprshot -m region -o ~/pics/ss"

      "CONTROL, PRINT, exec, hyprpicker"

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

      "${mod}, G, togglefloating,"
      "${mod}, Q, killactive,"
      "${mod}, U, exec, dunstctl close-all"

      "${mod}, C, exec, code"
      "${mod}, F, exec, firefox"
      "${mod}, R, exec, ${term} -e ${shell} -c btop"

      "${mod}, T, exec, ${term}"
      "${mod}, E, exec, ${term} -e ${shell} -c yazi"

      "${mod}, L, exec, pidof hyprlock || hyprlock"
      "${mod}, S, exec, pidof ${menu} || ${menu} -show drun"

      "${mod} SHIFT, B, exec, pidof waybar || waybar"
      "${mod} SHIFT, N, exec, pidof bluetui || ${term} -o 'font.size=24' -e ${shell} -c bluetui"
      "${mod} SHIFT, P, exec, hyprctl reload"
      "${mod}, B, exec, ! pidof waybar || pkill waybar"
      "${mod}, N, exec, pidof wifitui || ${term} -o 'font.size=24' -e ${shell} -c wifitui"
      "${mod}, P, exec, hyprctl keyword monitor ', preferred, auto, 1, mirror, eDP-1'"

      "${mod}, M, exec, focus"
      "${mod}, P, exec, adjust-opacity -i"
      "${mod}, O, exec, adjust-opacity -d"
      "${mod}, W, exec, random-wall"
    ];

  bindle = [
    "${mod}, ESCAPE, exit,"
    "${mod} SHIFT, Q, exec, systemctl suspend"


    "${mod} SHIFT, I, exec, pidof hypridle || hypridle & disown && notify-send 'Hypridle activated!'"
    "${mod} SHIFT, Y, exec, pidof sunsetr || sunsetr & disown && notify-send 'Sunsetr activated!'"
    "${mod}, I, exec, ! pidof hypridle || pkill hypridle && notify-send 'Hypridle deactivated!'"
    "${mod}, Y, exec, ! pidof sunsetr || pkill sunsetr && notify-send 'Sunsetr deactivated!'"

    "${mod}, SPACE, exec, switch-kb"

    ", XF86MonBrightnessUp, exec, brightnessctl -n2 set 5%+"
    ", XF86MonBrightnessDown, exec, brightnessctl -n2 set 5%-"

    ", XF86AudioPlay, exec, playerctl play-pause"
    ", XF86AudioPrev, exec, playerctl previous"
    ", XF86AudioNext, exec, playerctl next"

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
    "dunst"
    "hypridle"
    "sunsetr"
    "swww-daemon"
    "random-wall"
    "waybar"
  ];

  general = {
    allow_tearing = false;
    border_size = 3;
    "col.active_border" = "${hyprColors.blue}";
    "col.inactive_border" = "${hyprColors.black}";
    gaps_in = 5;
    gaps_out = 5;
    layout = "master";
    resize_on_border = true;
  };

  gesture = ["3, horizontal, workspace"];

  input = {
    follow_mouse = 1;
    kb_layout = "us,latam";
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

  monitor = ["eDP-1, 1920x1080@60, 0x0, 1"];

  windowrule = [
    "nofocus, class:^$, title:^$, xwayland:1, floating:1, fullscreen:0, pinned:0"
    "suppressevent maximize, class:.*"
  ];

  windowrulev2 = [
    "fullscreenstate 0 3, class:code*"
    "noinitialfocus, class:(jetbrains-)(.*)"
  ];

  xwayland.force_zero_scaling = true;
}
