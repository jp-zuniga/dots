{...}: let
  cursorSize = 30;

  catppuccin = import ./catppuccin.nix {inherit cursorSize;};
  rose-pine = import ./rose-pine.nix {inherit cursorSize;};
in {
  flake.lib.mkTheme = catppuccin;
}
