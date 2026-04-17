{
  colors,
  pkgs,
  ...
}: let
  dunstConf = ''
    [global]
    background = "${colors.base}"
    corner_radius = 5
    foreground = "${colors.foreground}"
    frame_width = 3
    font = mono 12
    gap_size = 5
    height = (0, 500)
    padding = 10
    offset = (5, 5)
    origin = top-right
    width = (0, 500)
    word_wrap = yes

    [urgency_low]
    frame_color = "${colors.black}"
    timeout = 5

    [urgency_normal]
    frame_color = "${colors.blue}"
    timeout = 10

    [urgency_critical]
    frame_color = "${colors.red}"
  '';
in
  pkgs.writeText "dunstrc" dunstConf
