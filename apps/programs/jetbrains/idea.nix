{
  inputs,
  pkgs,
  ...
}: let
  unstable = import inputs.nixpkgs-unstable {
    system = pkgs.stdenv.hostPlatform.system;
    config.allowUnfree = true;
  };
in {
  environment.systemPackages = [pkgs.jetbrains.idea-ultimate pkgs.postgresql_jdbc];
  programs.java = {
    enable = true;
    package = pkgs.jdk17;
  };
}
