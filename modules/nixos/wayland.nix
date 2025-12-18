{pkgs, ...}: {
  environment.sessionVariables.NIXOS_OZONE_WL = 1;
  hardware.graphics.enable = true;
}
