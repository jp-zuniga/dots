{pkgs, ...}: let
  bc = "${pkgs.bc}/bin/bc";
  hctl = "${pkgs.hyprland}/bin/hyprctl";
in
  pkgs.writeShellScriptBin "adjust-opacity" ''
    OLD_OPACITY=$(${hctl} getprop active opacity)

    case "$1" in
      "-i")
        NEW_OPACITY=$(echo "$OLD_OPACITY + 0.1" | ${bc} -l)
        if (( $(echo "$NEW_OPACITY > 1.0" | ${bc} -l) )); then
          NEW_OPACITY=1.0
        fi
      ;;
      "-d")
        NEW_OPACITY=$(echo "$OLD_OPACITY - 0.1" | ${bc} -l)
        if (( $(echo "$NEW_OPACITY < 0.25" | ${bc} -l) )); then
          NEW_OPACITY=0.25
        fi
      ;;
    esac

    ${hctl} dispatch 'hl.dsp.window.set_prop({ prop = "opacity", value = '"$NEW_OPACITY"' })'
  ''
