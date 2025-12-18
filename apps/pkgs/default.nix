{
  lib,
  pkgs,
  theme,
  ...
}: let
  scripts = import ./scripts {inherit pkgs;};
  wrapped = import ./wrapped {inherit lib pkgs theme;};
in {
  environment.systemPackages = builtins.attrValues (scripts // wrapped);
  imports = [./wrapped/btop/btop-theme.nix];
}
