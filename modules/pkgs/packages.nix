{
  config,
  lib,
  pkgs,
  theme,
  users,
  ...
}: let
  scripts = import ./scripts {inherit pkgs theme;};
  wrapped = import ./wrapped {inherit lib pkgs theme users;};
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
