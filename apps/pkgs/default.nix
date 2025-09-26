{
  inputs,
  lib,
  pkgs,
  theme,
  ...
}: let
  unstable = import inputs.nixpkgs-unstable {system = pkgs.stdenv.hostPlatform.system;};

  scripts = import ./scripts {inherit pkgs theme;};
  wrapped = import ./wrapped {inherit lib pkgs unstable theme;};
in {
  environment.systemPackages = builtins.attrValues (scripts // wrapped);
  imports = [./wrapped/btop/btop-theme.nix];
}
