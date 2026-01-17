{
  inputs,
  flake,
  pkgs,
  theme,
  users,
  ...
}: {
  programs.yazi.enable = true;
  system.activationScripts.yaziSetup = {
    deps = [];
    text = let
      yaziConf = import ./yazi-conf.nix {inherit flake pkgs;};
      yaziTheme = import ./yazi-theme.nix {inherit flake pkgs theme;};

      yaziLocation = "${users.jaq.home}/.config/yazi";
      flavorLocation = "${yaziLocation}/flavors/rose-pine-${theme.rosePineVariant}.yazi";
    in ''
      mkdir -p ${yaziLocation} ${flavorLocation}

      ln -sf ${yaziConf} ${yaziLocation}/yazi.toml
      ln -sf ${yaziTheme} ${yaziLocation}/theme.toml

      cp -f ${inputs.yaziTheme}/* ${flavorLocation}
    '';
  };
}
