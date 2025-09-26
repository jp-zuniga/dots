{
  config,
  pkgs,
  theme,
  ...
}: let
  ezaTheme = import ./eza-theme.nix {inherit pkgs theme;};
  themeLocation = config.users.users.jaq.home + "/.config/eza";
in {
  environment.systemPackages = [pkgs.eza];
  system.activationScripts.ezaSetup = ''
    mkdir -p ${themeLocation}
    ln -sf ${ezaTheme} ${themeLocation}/theme.yml
  '';
}
