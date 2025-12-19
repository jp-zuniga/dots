{inputs, ...}: {
  flake.lib.mkTheme = {pkgs, ...}: let
    cursorSize = 30;

    catppuccin = import ./catppuccin.nix {inherit cursorSize pkgs;};
    rose-pine = import ./rose-pine.nix {inherit cursorSize pkgs;};

    legacy-rose-pine = import ./legacy-rose-pine.nix {inherit cursorSize pkgs;};
  in
    legacy-rose-pine;
}
