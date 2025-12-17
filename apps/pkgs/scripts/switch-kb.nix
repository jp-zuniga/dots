{pkgs, ...}:
pkgs.writeShellScriptBin "switch-kb" ''
  hyprctl switchxkblayout current next

  NEW=$(get-kb)

  pidof hyprlock || notify-send "$NEW"
''
