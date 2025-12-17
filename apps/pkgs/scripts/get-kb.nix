# originally written by: dromse
#   - author: https://github.com/dromse
#   - source: https://github.com/dromse/hyprland-keyboard-layout/blob/35c21863c90becc30fffc5a85b7072ce434bea9d/hyprland-keyboard-layout.sh
#
# licensed under: n/a
#   - no license was provided by author
#   - its inclusion in this repository is licensed under the GPLv3
#
# changes:
#   - removed substring calculation in final pipe
#
{pkgs, ...}:
pkgs.writeShellScriptBin "get-kb" ''
  DEVICE="at-translated-set-2-keyboard"
  HEADING="active keymap:"

  LAYOUT=$(hyprctl devices | grep -A 3 "$DEVICE" | grep "$HEADING" | tail -n 1 | awk '{print $3}')

  echo 󰌌 $LAYOUT
''
