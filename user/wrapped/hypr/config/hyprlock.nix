hyprColors: {
  general = {
    monitor = "";
    disable_loading_bar = true;
    hide_cursor = true;
  };

  background = [
    {
      monitor = "";
      blur_passes = 1;
      blur_size = 3;
      color = hyprColors.bg;
      path = "~/.cache/.current-wall";
    }
  ];

  input-field = [
    {
      monitor = "eDP-1";
      position = "0, 0";
      size = "360, 60";
      font_family = "monospace";

      halign = "center";
      valign = "center";

      dots_center = true;
      dots_size = 0.1;
      dots_spacing = 0.1;

      capslock_color = hyprColors.gold;
      check_color = hyprColors.pine;
      font_color = hyprColors.text;
      inner_color = hyprColors.surface;
      outer_color = hyprColors.iris;
      fail_color = hyprColors.love;

      fade_on_empty = false;
      hide_input = false;
      outline_thickness = 3;

      fail_text = "󰌾 $USER";
      placeholder_text = "󰌾 $USER";
    }
  ];

  label = [
    {
      monitor = "";
      position = "20, -8";
      halign = "left";
      valign = "top";
      color = hyprColors.text;
      font_size = 36;
      font_family = "monospace";
      text = "cmd[update:43200000] date +'%x'";
    }
    {
      monitor = "";
      position = "-20, -8";
      halign = "right";
      valign = "top";
      color = hyprColors.text;
      font_size = 36;
      font_family = "monospace";
      text = "$TIME";
    }
  ];
}
