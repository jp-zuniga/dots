{
  pkgs,
  lib,
  ...
}: let
  packettracer9 = pkgs.callPackage ./v9-derivation.nix {
    packetTracerSource = /home/jaq/docs/CiscoPacketTracer_900_Ubuntu_64bit.deb;
  };
in {
  environment.systemPackages = [packettracer9];

  programs.firejail = {
    enable = true;
    wrappedBinaries.packettracer9 = {
      executable = lib.getExe packettracer9;
      extraArgs = [
        "--net=none"
        "--noprofile"
        "--env=QT_QPA_PLATFORMTHEME="
        "--env=QT_STYLE_OVERRIDE=Fusion"
      ];
    };
  };
}
