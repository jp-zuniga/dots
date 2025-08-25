{
  config,
  pkgs,
  theme
}: let
  themeLocation = config.users.users.jaq.home + "/.config/qBittorrent/themes";
  qbitTheme = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/rose-pine/qbittorrent/main/dist/moon.qbtheme";
    hash = "sha256-0qsbiypmwxljaqjs5azamgd7gljrjfw9g8x7h13vi4psy7i6aaam";
  };
in {
  environment.systemPackages = [pkgs.qbittorrent];
  environment.activationScripts.qbittorrentSetup = ''
    mkdir -p ${themeLocation}
    cp -f ${qbitTheme} ${themeLocation}/${theme.rosePineVariant}.qbtheme
  '';
}
