{
  config,
  pkgs,
  theme,
  ...
}: let
  themeLocation = config.users.users.jaq.home + "/.config/qBittorrent/themes";
  qbitTheme = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/rose-pine/qbittorrent/main/dist/${theme.rosePineVariant}.qbtheme";
    hash = "sha256-VSll4vH6krhHgKejl7iTWdJ32qvqq6IlVpJ2Xq+PS2M=";
  };
in {
  environment.systemPackages = [pkgs.qbittorrent];
  system.activationScripts.qbittorrentSetup = {
    deps = [];
    text = ''
      mkdir -p ${themeLocation}
      ln -sf ${qbitTheme} ${themeLocation}/rose-pine-${theme.rosePineVariant}.qbtheme
    '';
  };
}
