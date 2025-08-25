{pkgs}: {
  hardware = {
    graphics.enable = true;
  };

  environment = {
    sessionVariables.NIXOS_OZONE_WL = 1;
  };

  xdg.portal = {
    enable = true;
    config.common.default = "*";
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };
}
