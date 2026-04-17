{
  flake,
  lib,
  pkgs,
  theme,
  unstable,
  ...
}: let
  hyprland = "hyprlandWrapped";
  scripts = import ./scripts {inherit pkgs theme;};
  # @ts: typeof: Record<string, Derivation>
  wrapped = import ./wrapped {inherit flake lib pkgs theme unstable;};
in {
  environment.systemPackages = builtins.attrValues (
    scripts // (builtins.removeAttrs wrapped [hyprland])
  );

  imports = [./wrapped/btop/btop-theme.nix];

  programs.hyprland = {
    enable = true;
    package = wrapped.hyprland;
  };
}
