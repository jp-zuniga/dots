{
  config,
  inputs,
  pkgs,
  theme,
  ...
}: let
  yazTheme = import ./yazi-theme.nix {inherit pkgs theme;};
  yaziConf = import ./yazi-conf.nix {inherit pkgs theme;};
  yaziLocation = config.users.users.jaq.home + "/.config/yazi";
  flavorLocation = "${yaziLocation}/flavors/rose-pine-${theme.rosePineVariant}.yazi";
in {
  programs.yazi = {
    enable = true;
  };

  system.activationScripts.yaziSetup = ''
    mkdir -p ${yaziLocation} ${flavorLocation}
    ln -sf ${yaziConf} ${yaziLocation}/yazi.toml
    ln -sf ${yazTheme} ${yaziLocation}/theme.toml
    cp -f ${inputs.yaziTheme}/* ${flavorLocation}
  '';
}
