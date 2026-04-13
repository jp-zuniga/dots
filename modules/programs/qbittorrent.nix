{
  pkgs,
  theme,
  users,
  ...
}: {
  environment.systemPackages = [pkgs.qbittorrent];
  system.activationScripts.qbittorrentSetup = {
    deps = [];
    text = let
      themeLocation = "${users.jaq.home}/.config/qBittorrent/themes";
      qbitTheme = pkgs.fetchurl {
        hash = "sha256-9t31ntiB6kpCPo1Ipz9vUHxZSlYPOYCXiR/LcLyCVeE=";
        url = "${theme.github}/qbittorrent/releases/latest/download/${theme.kebabName}.qbtheme";
      };
    in ''
      mkdir -p ${themeLocation}

      ln -sf ${qbitTheme} ${themeLocation}/${theme.kebabName}.qbtheme
    '';
  };
}
