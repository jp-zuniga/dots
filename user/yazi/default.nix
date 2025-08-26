{
  config,
  inputs,
  pkgs,
  theme,
  ...
}: let
  yaziLocation = config.users.users.jaq.home + "/.config/yazi";
  flavorLocation = "${yaziLocation}/flavors/rose-pine${theme.rosePineVariant}.yazi";
in {
  programs.yazi = {
    enable = true;
    settings = {
      theme = import ./yazi-theme.nix pkgs;
      yazi = import ./yazi-conf.nix pkgs;
    };
  };

  system.activationScripts.yaziSetup = ''
    mkdir -p ${yaziLocation} ${flavorLocation}
    cp -f ${inputs.yaziTheme}/* ${flavorLocation}
  '';
}
