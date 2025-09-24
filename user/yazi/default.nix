{
  config,
  inputs,
  pkgs,
  theme,
  ...
}: let
  yaziTheme = import ./yazi-theme.nix {inherit pkgs theme;};
  yaziConf = import ./yazi-conf.nix pkgs;
  yaziLocation = config.users.users.jaq.home + "/.config/yazi";
  flavorLocation = "${yaziLocation}/flavors/rose-pine-${theme.rosePineVariant}.yazi";
in {
  programs.yazi.enable = true;
  system.activationScripts.yaziSetup = ''
    mkdir -p ${yaziLocation} ${flavorLocation}
    ln -sf ${yaziConf} ${yaziLocation}/yazi.toml
    ln -sf ${yaziTheme} ${yaziLocation}/theme.toml
    cp -f ${inputs.yaziTheme}/* ${flavorLocation}
  '';
}
