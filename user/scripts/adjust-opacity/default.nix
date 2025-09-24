{pkgs, ...}:
pkgs.writeShellScriptBin "adjust-opacity" ''
  WINDOW=$(hyprctl activewindow -j | jq -r '.address')
  OLD_ALPHA=$(hyprctl activewindow -j | jq -r '.alpha')

  if [ "$OLD_ALPHA" = "null" ] || [ -z "$OLD_ALPHA" ]; then
    OLD_ALPHA=1.0
  fi

  case "$1" in
    "increase")
      NEW_ALPHA=$(echo "$OLD_ALPHA + 0.1" | bc -l)
      if (( $(echo "$NEW_ALPHA > 1.0" | bc -l) )); then
        NEW_ALPHA=1.0
      fi
      ;;
    "decrease")
      NEW_ALPHA=$(echo "$OLD_ALPHA - 0.1" | bc -l)
      if (( $(echo "$NEW_ALPHA < 0.25" | bc -l) )); then
        NEW_ALPHA=0.25
      fi
      ;;
  esac

  hyprctl dispatch setprop address:$WINDOW alpha $NEW_ALPHA
''
