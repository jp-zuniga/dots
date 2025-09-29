{lib, ...}: {
  networking = {
    firewall.enable = true;
    networkmanager = {
      enable = true;
      wifi = {
        powersave = true;
      };
    };

    useDHCP = lib.mkDefault true;
  };

  systemd.services.NetworkManager-wait-online.enable = false;
}
