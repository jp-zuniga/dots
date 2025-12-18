{inputs, ...}: {
  flake.lib.mkTheme = {pkgs, ...}: let
    cursorSize = 30;

    catppuccin = import ./catppuccin.nix {inherit pkgs cursorSize;};
    rose-pine = import ./rose-pine.nix {inherit pkgs cursorSize;};
  in
    rose-pine;
}
