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
  environment.systemPackages = [pkgs.jetbrains.idea-ultimate];
  programs.java = {
    enable = true;
    package = pkgs.jdk17;
  };
}
