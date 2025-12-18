{
  config,
  pkgs,
  theme,
  ...
}: {
  environment.systemPackages = [pkgs.eza];
  system.activationScripts.ezaSetup = {
    deps = [];
    text = let
      ezaTheme = import ./eza-theme.nix {inherit pkgs theme;};
      themeLocation = config.users.users.jaq.home + "/.config/eza";
    in ''
      mkdir -p ${themeLocation}
      ln -sf ${ezaTheme} ${themeLocation}/theme.yml
    '';
  };
}
