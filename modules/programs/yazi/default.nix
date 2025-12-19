{
  inputs,
  pkgs,
  theme,
  users,
  ...
}: {
  programs.yazi.enable = true;
  system.activationScripts.yaziSetup = {
    deps = [];
    text = let
      yaziTheme = import ./yazi-theme.nix {inherit pkgs theme;};
      yaziConf = import ./yazi-conf.nix {inherit pkgs;};
      yaziLocation = users.jaq.home + "/.config/yazi";
      flavorLocation = "${yaziLocation}/flavors/rose-pine-${theme.rosePineVariant}.yazi";
    in ''
      mkdir -p ${yaziLocation} ${flavorLocation}

      ln -sf ${yaziConf} ${yaziLocation}/yazi.toml
      ln -sf ${yaziTheme} ${yaziLocation}/theme.toml

      cp -f ${inputs.yaziTheme}/* ${flavorLocation}
    '';
  };
}
