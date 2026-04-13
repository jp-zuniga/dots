{config, ...}: {
  programs.steam = {
    enable = true;
    extraPackages = [config.sys.cursor];
  };
}
