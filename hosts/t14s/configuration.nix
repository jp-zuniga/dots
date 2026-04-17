{
  flake,
  inputs,
  lib,
  pkgs,
  theme,
  ...
}: {
  imports = [
    ./hardware.nix
    inputs.homix.nixosModules.default
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t14s
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t14s-amd-gen1
  ];

  console = let
    clean = builtins.mapAttrs (_: value: lib.removePrefix "#" value) theme.colors;
    base8 = with clean; [base red green yellow blue magenta cyan white];
    bright8 = builtins.map (color: flake.lib.brightenColor color 20) base8;
  in {
    colors = base8 ++ bright8;
    earlySetup = true;
    font = "ter-v32n";
    packages = [pkgs.terminus_font];
  };

  hardware.laptop.enable = true;
  networking.hostName = "t14s";
  time.timeZone = "America/Managua";

  # - author: https://github.com/sioodmy
  # - source: https://github.com/sioodmy/dotfiles/blob/bef2621ebdf5fc37275e514590d83b5e520b8e72/hosts/calypso/default.nix
  #
  # - license:
  #   - GPLv3
  #     - https://github.com/sioodmy/dotfiles/blob/bef2621ebdf5fc37275e514590d83b5e520b8e72/LICENSE
  #
  # changes:
  #   - none
  #
  # ---------------------------------------------------------------------------------------
  systemd.services.micmute-led-off = {
    description = "kill mic-mute light";
    serviceConfig = {
      ExecStart = "${pkgs.bash}/bin/bash -c 'echo 0 > /sys/class/leds/platform::micmute/brightness'";
      TimeoutSec = 5;
      Type = "oneshot";
    };

    wantedBy = ["multi-user.target"];
  };
  # ---------------------------------------------------------------------------------------

  system.stateVersion = "25.05";
}
