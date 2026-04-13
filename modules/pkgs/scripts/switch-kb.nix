{pkgs, ...}: let
  hctl = "${pkgs.hyprland}/bin/hyprctl";
  notify = "${pkgs.libnotify}/bin/notify-send";
in
  pkgs.writeShellScriptBin "switch-kb" ''
    ${hctl} switchxkblayout current next

    NEW=$(get-kb)

    pidof hyprlock || ${notify} "$NEW"
  ''
