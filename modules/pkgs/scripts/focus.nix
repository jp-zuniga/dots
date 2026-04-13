{
  pkgs,
  theme,
  ...
}: let
  hctl = "${pkgs.hyprland}/bin/hyprctl";

  wyb-pkg = pkgs.callPackage ../wrapped/waybar {inherit theme;};
  wyb = "${wyb-pkg}/bin/waybar";
in
  pkgs.writeShellScriptBin "focus" ''
    MODE=$(${hctl} getoption animations:enabled | awk 'NR==1{print $2}')

    # disable visual eye-candy
    if [ "$MODE" = 1 ] ; then
      ! pidof waybar || pkill waybar
      ${hctl} keyword animations:enabled 0
      ${hctl} keyword decoration:blur:enabled 0
      ${hctl} keyword decoration:inactive_opacity 1.0
      ${hctl} keyword decoration:rounding 0
      ${hctl} keyword decoration:shadow:enabled 0
      ${hctl} keyword general:gaps_in 0
      ${hctl} keyword general:gaps_out 0
      ${hctl} keyword general:border_size 1
      exit 0

    # re-enable eye-candy
    else
      ${hctl} keyword animations:enabled 1
      ${hctl} keyword decoration:blur:enabled 1
      ${hctl} keyword decoration:inactive_opacity 0.8
      ${hctl} keyword decoration:rounding 5
      ${hctl} keyword decoration:shadow:enabled 0
      ${hctl} keyword general:gaps_in 5
      ${hctl} keyword general:gaps_out 5
      ${hctl} keyword general:border_size 3
      pidof waybar || ${wyb}
      exit 0
    fi

    # something terrible has happened
    exit 1
  ''
