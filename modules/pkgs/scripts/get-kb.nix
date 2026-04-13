{pkgs, ...}: let
  device = "at-translated-set-2-keyboard";
  hctl = "${pkgs.hyprland}/bin/hyprctl";
in
  # - author: https://github.com/dromse
  # - source: https://github.com/dromse/hyprland-keyboard-layout/blob/35c21863c90becc30fffc5a85b7072ce434bea9d/hyprland-keyboard-layout.sh
  #
  # - license:
  #   - n/a
  #   - its inclusion in this repository is licensed under the GPLv3
  #     - https://github.com/jp-zuniga/dots/blob/main/LICENSE
  #
  # - changes:
  #   - removed substring calculation in final pipe
  #
  # ---------------------------------------------------------------------------------------
  pkgs.writeShellScriptBin "get-kb" ''
    DEVICE=${device}
    HEADING="active keymap:"

    LAYOUT=$(${hctl} devices | grep -A 3 "$DEVICE" | grep "$HEADING" | tail -n 1 | awk '{print $3}')

    echo 󰌌 $LAYOUT
  ''
# ---------------------------------------------------------------------------------------

