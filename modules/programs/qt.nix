{
  pkgs,
  theme,
  users,
  ...
}: {
  environment = {
    sessionVariables.QT_QPA_PLATFORMTHEME = "qt5ct";
    systemPackages = [
      pkgs.darkly
      pkgs.darkly-qt5
    ];
  };

  system.activationScripts.qtSetup = {
    deps = [];
    text = let
      qtTheme = pkgs.fetchurl {
        hash = "sha256-2HIOxEuHqJrgzqT24SRoLyjTGXrutVy8KsH7MnO8AxM=";
        url = "${theme.rawGithub}/qt5ct/main/themes/${theme.kebabName}-sapphire.conf";
      };

      userConf = "${users.jaq.home}/.config";
    in ''
      QT5="${userConf}/qt5ct/colors"
      QT6="${userConf}/qt6ct/colors"

      mkdir -p $QT5 $QT6

      ln -sf ${qtTheme} $QT5
      ln -sf ${qtTheme} $QT6
    '';
  };

  qt = {
    enable = true;
    platformTheme = "qt5ct";
  };
}
