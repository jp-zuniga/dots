{
  pkgs,
  theme,
  users,
  ...
}: {
  environment = {
    sessionVariables = {
      QT_QPA_PLATFORMTHEME = "qt5ct";
    };

    systemPackages = [
      pkgs.libsForQt5.qt5ct
      pkgs.libsForQt5.qtstyleplugin-kvantum
      pkgs.rose-pine-kvantum
    ];
  };

  system.activationScripts.kvantumSetup = {
    deps = [];
    text = let
      kvantumConfig = pkgs.writeText "kvantum.kvconfig" ''
        [General]
        theme=rose-pine
      '';

      kvantumFlavor = "rose-pine-${theme.rosePineVariant}-iris";
      kvantumLocation = "${users.jaq.home}/.config/Kvantum";
    in ''
      mkdir -p ${kvantumLocation} ${kvantumLocation}/rose-pine

      ln -sf ${pkgs.rose-pine-kvantum}/share/Kvantum/themes/${kvantumFlavor}/${kvantumFlavor}.kvconfig ${kvantumLocation}/rose-pine
      ln -sf ${kvantumConfig} ${kvantumLocation}/kvantum.kvconfig
    '';
  };

  qt = {
    enable = true;
    platformTheme = "qt5ct";
  };
}
