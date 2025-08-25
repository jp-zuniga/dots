theme: {
  general = {
    monitor = "";
    disable_loading_bar = true;
    hide_cursor = false;
  };

  background = [
    {
      monitor = "";
      blur_passes = 1;
      blur_size = 3;
      color = theme.bg;
      path = "~/.cache/.current-wall";
    }
  ];

  input-field = [
    {
      monitor = "eDP-1";
      position = "0, 0";
      size = "360, 60";

      halign = "center";
      valign = "center";

      dots_center = true;
      dots_size = 0.1;
      dots_spacing = 0.1;

      capslock_color = theme.gold;
      check_color = theme.pine;
      font_color = theme.text;
      inner_color = theme.surface;
      outer_color = theme.iris;
      fail_color = theme.love;

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
      color = theme.text;
      font_size = 36;
      text = "cmd[update:43200000] date +'%x'";
    }
    {
      monitor = "";
      position = "-20, -8";
      halign = "right";
      valign = "top";
      color = theme.text;
      font_size = 36;
      text = "$TIME";
    }
  ];
}
