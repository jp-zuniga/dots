{hyprColors, ...}: let
  toLuaColor = c: "rgba(${builtins.substring 4 6 c}${builtins.substring 2 2 c})";
in ''
  local mod = "SUPER"
  local menu = "rofi"
  local shell = "fish"
  local term = "alacritty"

  hl.monitor({
    output = "eDP-1",
    mode = "1920x1080@60",
    position = "0x0",
    scale = 1,
  })

  hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")

  hl.on(
    "hyprland.start",
    function()
      hl.exec_cmd("dunst")
      hl.exec_cmd("hypridle")
      hl.exec_cmd("sunsetr")
      hl.exec_cmd("awww-daemon")
      hl.exec_cmd("random-wall")
      hl.exec_cmd("waybar")
    end
  )

  hl.config({
    general = {
      allow_tearing = false,
      border_size = 3,
      col = {
        active_border = "${toLuaColor hyprColors.blue}",
        inactive_border = "${toLuaColor hyprColors.black}",
      },
      gaps_in = 5,
      gaps_out = 5,
      layout = "master",
      resize_on_border = true,
    },

    decoration = {
      active_opacity = 1.0,
      inactive_opacity = 0.9,
      rounding = 5,
      rounding_power = 5,
      dim_inactive = true,
      dim_strength = 0.25,

      shadow = {
        enabled = false,
      },

      blur = {
        enabled = true,
        passes = 1,
        size = 3,
      },
    },

    animations = {
      enabled = true,
    },

    master = {
      new_status = "master",
    },

    misc = {
      disable_autoreload = true,
      disable_hyprland_logo = true,
      force_default_wallpaper = 0,
    },

    ecosystem = {
      no_update_news = true,
      no_donation_nag = true,
    },

    debug = {
      disable_logs = false,
    },

    xwayland = {
      force_zero_scaling = true,
    },
  })

  hl.animation({ leaf = "border", enabled = true, speed = 2, bezier = "default" })
  hl.animation({ leaf = "fade", enabled = true, speed = 4, bezier = "default" })
  hl.animation({ leaf = "windows", enabled = true, speed = 2, bezier = "default" })
  hl.animation({ leaf = "workspaces", enabled = true, speed = 3, bezier = "default", style = "slide" })

  hl.config({
    input = {
      follow_mouse = 1,
      kb_layout = "us,latam",
      sensitivity = 0,

      touchpad = {
        natural_scroll = true,
      },
    },
  })

  hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
  })

  for i = 1, 10 do
    local key = i % 10
    hl.bind(mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
    hl.bind(mod .. " + ALT + " .. key, hl.dsp.window.move({ workspace = i, silent = true }))
  end

  hl.bind("ALT + Tab", hl.dsp.window.cycle_next())
  hl.bind("ALT + SHIFT + Tab", hl.dsp.window.cycle_next("prev"))
  hl.bind(mod .. " + Tab", hl.dsp.focus({ workspace = "previous" }))

  hl.bind(mod .. " + PRINT", hl.dsp.exec_cmd("hyprshot -m active -m output -o ~/pics/ss"))
  hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m active -m window -o ~/pics/ss"))
  hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m region -o ~/pics/ss"))
  hl.bind("CONTROL + PRINT", hl.dsp.exec_cmd("hyprpicker"))

  hl.bind("ALT + SHIFT + W", hl.dsp.focus({ direction = "u" }))
  hl.bind("ALT + SHIFT + A", hl.dsp.focus({ direction = "d" }))
  hl.bind("ALT + SHIFT + S", hl.dsp.focus({ direction = "l" }))
  hl.bind("ALT + SHIFT + D", hl.dsp.focus({ direction = "r" }))

  hl.bind("ALT + CONTROL + W", hl.dsp.window.swap({ direction = "u" }))
  hl.bind("ALT + CONTROL + A", hl.dsp.window.swap({ direction = "d" }))
  hl.bind("ALT + CONTROL + S", hl.dsp.window.swap({ direction = "l" }))
  hl.bind("ALT + CONTROL + D", hl.dsp.window.swap({ direction = "r" }))

  hl.bind("CONTROL + SHIFT + W", hl.dsp.layout("orientationtop"))
  hl.bind("CONTROL + SHIFT + A", hl.dsp.layout("orientationbottom"))
  hl.bind("CONTROL + SHIFT + S", hl.dsp.layout("orientationleft"))
  hl.bind("CONTROL + SHIFT + D", hl.dsp.layout("orientationright"))

  hl.bind(mod .. " + G", hl.dsp.window.float({ action = "toggle" }))
  hl.bind(mod .. " + Q", hl.dsp.window.close())
  hl.bind(mod .. " + U", hl.dsp.exec_cmd("dunstctl close-all"))

  hl.bind(mod .. " + C", hl.dsp.exec_cmd("code"))
  hl.bind(mod .. " + F", hl.dsp.exec_cmd("firefox"))
  hl.bind(mod .. " + R", hl.dsp.exec_cmd(term .. " -e " .. shell .. " -c btop"))
  hl.bind(mod .. " + T", hl.dsp.exec_cmd(term))
  hl.bind(mod .. " + E", hl.dsp.exec_cmd(term .. " -e " .. shell .. " -c yazi"))

  hl.bind(mod .. " + L", hl.dsp.exec_cmd("pidof hyprlock || hyprlock"))
  hl.bind(mod .. " + S", hl.dsp.exec_cmd("pidof " .. menu .. " || " .. menu .. " -show drun"))

  hl.bind(mod .. " + SHIFT + B", hl.dsp.exec_cmd("pidof waybar || waybar"))
  hl.bind(mod .. " + SHIFT + N", hl.dsp.exec_cmd("pidof bluetui || " .. term .. " -o 'font.size=16' -e " .. shell .. " -c bluetui"))
  hl.bind(mod .. " + SHIFT + P", hl.dsp.exec_cmd("hyprctl reload"))
  hl.bind(mod .. " + B", hl.dsp.exec_cmd("! pidof waybar || pkill waybar"))
  hl.bind(mod .. " + N", hl.dsp.exec_cmd("pidof wifitui || " .. term .. " -o 'font.size=16' -e " .. shell .. " -c wifitui"))

  hl.bind(mod .. " + M", hl.dsp.exec_cmd("focus"))
  hl.bind(mod .. " + P", hl.dsp.exec_cmd("adjust-opacity -i"))  -- WARNING: duplicate mod+P
  hl.bind(mod .. " + O", hl.dsp.exec_cmd("adjust-opacity -d"))
  hl.bind(mod .. " + W", hl.dsp.exec_cmd("random-wall"))

  hl.bind(mod .. " + ESCAPE", hl.dsp.exit(), { locked = true, repeating = true })
  hl.bind(mod .. " + SHIFT + Q", hl.dsp.exec_cmd("systemctl suspend"), { locked = true, repeating = true })

  hl.bind(mod .. " + SHIFT + I", hl.dsp.exec_cmd("pidof hypridle || hypridle & disown && notify-send 'Hypridle activated!'"), { locked = true, repeating = true })
  hl.bind(mod .. " + SHIFT + Y", hl.dsp.exec_cmd("pidof sunsetr || sunsetr & disown && notify-send 'Sunsetr activated!'"), { locked = true, repeating = true })
  hl.bind(mod .. " + I", hl.dsp.exec_cmd("! pidof hypridle || pkill hypridle && notify-send 'Hypridle deactivated!'"), { locked = true, repeating = true })
  hl.bind(mod .. " + Y", hl.dsp.exec_cmd("! pidof sunsetr || pkill sunsetr && notify-send 'Sunsetr deactivated!'"), { locked = true, repeating = true })

  hl.bind(mod .. " + SPACE", hl.dsp.exec_cmd("switch-kb"), { locked = true, repeating = true })

  hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -n2 set 5%+"), { locked = true, repeating = true })
  hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -n2 set 5%-"), { locked = true, repeating = true })

  hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true, repeating = true })
  hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true, repeating = true })
  hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true, repeating = true })

  hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
  hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
  hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
  hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })

  hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
  hl.bind(mod .. " + Control_L", hl.dsp.window.drag(), { mouse = true })
  hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
  hl.bind(mod .. " + ALT_L", hl.dsp.window.resize(), { mouse = true })

  hl.window_rule({
    name = "no-initial-focus-empty-xwayland",
    match = {
      class = "^$",
      title = "^$",
      xwayland = true,
      float = true,
      fullscreen = false,
      pin = false,
    },
    no_focus = true,
  })

  hl.window_rule({
    name = "suppress-maximize",
    match = { class = ".*" },
    suppress_event = "maximize",
  })
''
