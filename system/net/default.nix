{...}: {
  networking = {
    firewall.enable = true;
    networkmanager = {
      enable = true;
      wifi = {
        powersave = true;
      };
    };

    useDHCP = true;
  };

  systemd.services.NetworkManager-wait-online.enable = false;
}
