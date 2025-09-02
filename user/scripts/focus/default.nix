{pkgs, ...}:
pkgs.writeShellScriptBin "focus" ''
  MODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')

  # disable visual eye-candy
  if [ "$MODE" = 1 ] ; then
    ! pidof waybar  || pkill waybar &
    hyprctl keyword animations:enabled 0 &
    hyprctl keyword decoration:blur:enabled 0 &
    hyprctl keyword decoration:rounding 0 &
    hyprctl keyword decoration:shadow:enabled 0 &
    hyprctl keyword general:gaps_in 0 &
    hyprctl keyword general:gaps_out 0 &
    hyprctl keyword general:border_size 1 &
    exit 0

  # re-enable eye-candy
  else
    hyprctl keyword animations:enabled 1 &
    hyprctl keyword decoration:blur:enabled 1 &
    hyprctl keyword decoration:rounding 5 &
    hyprctl keyword decoration:shadow:enabled 0 &
    hyprctl keyword general:gaps_in 5 &
    hyprctl keyword general:gaps_out 5 &
    hyprctl keyword general:border_size 3 &
    pidof waybar || waybar &
    exit 0
  fi

  # something terrible has happened
  exit 1
''
