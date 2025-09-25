{pkgs, ...}:
pkgs.writeShellScriptBin "adjust-opacity" ''
  OLD_ALPHA=$(hyprctl getprop activewindow alpha)

  case "$1" in
    "-i")
      NEW_ALPHA=$(echo "$OLD_ALPHA + 0.1" | bc -l)
      if (( $(echo "$NEW_ALPHA > 1.0" | bc -l) )); then
        NEW_ALPHA=1.0
      fi
    ;;
    "-d")
      NEW_ALPHA=$(echo "$OLD_ALPHA - 0.1" | bc -l)
      if (( $(echo "$NEW_ALPHA < 0.25" | bc -l) )); then
        NEW_ALPHA=0.25
      fi
    ;;
  esac

  hyprctl dispatch setprop activewindow alpha $NEW_ALPHA
''
