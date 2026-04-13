_: {
  flake.lib.mkTheme = {
    lib,
    pkgs,
    ...
  }:
    import ./catppuccin.nix {
      inherit lib pkgs;
      cursorSize = 24;
    };
}
