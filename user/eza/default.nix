{
  config,
  pkgs,
  theme,
  ...
}: let
  themeLocation = config.users.users.jaq.home + "/.config/eza";
  ezaTheme = import ./eza-theme.nix {inherit pkgs theme;};
in {
  environment.systemPackages = [pkgs.eza];
  system.activationScripts.ezaSetup = ''
    mkdir -p ${themeLocation}
    cp -f ${ezaTheme} ${themeLocation}
  '';
}
