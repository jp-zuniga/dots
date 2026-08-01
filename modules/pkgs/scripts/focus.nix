{
  pkgs,
  theme,
  ...
}: let
  hctl = "${pkgs.hyprland}/bin/hyprctl";
  jq = "${pkgs.jq}/bin/jq";

  wyb-pkg = pkgs.callPackage ../wrapped/waybar {inherit theme;};
  wyb = "${wyb-pkg}/bin/waybar";
in
  pkgs.writeShellScriptBin "focus" ''
    MODE=$(${hctl} getoption -j animations:enabled | ${jq} -r '.bool')

    # disable visual eye-candy
    if [ "$MODE" = "true" ] ; then
      ! pidof waybar || pkill waybar

      ${hctl} eval '
        hl.config({
          animations = { enabled = false },
          decoration = {
            blur = { enabled = false },
            inactive_opacity = 1.0,
            rounding = 0,
            shadow = { enabled = false },
          },
          general = {
            gaps_in = 0,
            gaps_out = 0,
            border_size = 1,
          },
        })
      '

      exit 0

    # re-enable eye-candy
    else
      ${hctl} eval '
        hl.config({
          animations = { enabled = true },
          decoration = {
            blur = { enabled = true },
            inactive_opacity = 0.8,
            rounding = 5,
            shadow = { enabled = false },
          },
          general = {
            gaps_in = 5,
            gaps_out = 5,
            border_size = 3,
          },
        })
      '

      pidof waybar || ${wyb}
      exit 0
    fi

    # something terrible has happened
    exit 1
  ''
