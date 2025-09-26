{
  inputs,
  lib,
  pkgs,
  ...
}: let
  theme = import ..//theme pkgs;
  unstable = import inputs.nixpkgs-unstable {system = pkgs.stdenv.hostPlatform.system;};

  scripts = pkgs.callPackage ./scripts {inherit pkgs theme;};
  wrapped = pkgs.callPackage ./wrapped {inherit lib pkgs unstable theme;};
in {
  environment.systemPackages = builtins.attrValues (scripts // wrapped);
  imports = [./wrapped/btop-theme.nix];
}
