{
  flake,
  lib,
  pkgs,
  theme,
  ...
}: let
  scripts = import ./scripts {inherit pkgs theme;};
  wrapped = import ./wrapped {inherit flake lib pkgs theme;};
in {
  environment.systemPackages = builtins.attrValues (
    scripts // (builtins.removeAttrs wrapped ["hyprland-wrapped"])
  );

  imports = [./wrapped/btop/btop-theme.nix];

  programs.hyprland = {
    enable = true;
    package = wrapped.hyprland-wrapped;
  };
}
