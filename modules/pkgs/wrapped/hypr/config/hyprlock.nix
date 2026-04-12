{hyprColors, ...}: {
  general.hide_cursor = true;

  background = [
    {
      blur_passes = 1;
      blur_size = 3;
      color = hyprColors.base;
      path = "~/.cache/.current-wall";
    }
  ];

  input-field = [
    {
      position = "0, 0";
      size = "360, 60";
      font_family = "monospace";

      halign = "center";
      valign = "center";

      dots_center = true;
      dots_size = 0.1;
      dots_spacing = 0.1;

      capslock_color = hyprColors.yellow;
      check_color = hyprColors.cyan;
      font_color = hyprColors.white;
      inner_color = hyprColors.accent;
      outer_color = hyprColors.magenta;
      fail_color = hyprColors.red;

      fade_on_empty = false;
      hide_input = false;
      outline_thickness = 3;

      fail_text = "󰌾 $USER";
      placeholder_text = "󰌾 $USER";
    }
  ];

  label = [
    {
      position = "20, -8";
      halign = "left";
      valign = "top";
      color = hyprColors.white;
      font_size = 36;
      font_family = "monospace";
      text = "cmd[update:43200000] date +'%x'";
    }
    {
      position = "-20, -8";
      halign = "right";
      valign = "top";
      color = hyprColors.white;
      font_size = 36;
      font_family = "monospace";
      text = "$TIME";
    }
    {
      position = "0, 20";
      halign = "center";
      valign = "bottom";
      color = hyprColors.green;
      font_size = 14;
      font_family = "monospace";
      text = "cmd[update:50] get-kb";
    }
  ];
}
