{
  config,
  pkgs,
  theme,
  ...
}: {
  system.activationScripts.btopSetup = {
    deps = [];
    text = let
      btopThemeLocation = config.users.users.jaq.home + "/.config/btop/themes";
      btopTheme = pkgs.fetchurl {
        url = "https://raw.githubusercontent.com/rose-pine/btop/main/rose-pine-${theme.rosePineVariant}.theme";
        hash = "sha256-iJNhWAQ6xzl6EsI0wWxtN14/KqZ7YWZFJaqFOZjLO8g=";
      };
    in ''
      mkdir -p ${btopThemeLocation}
      ln -sf ${btopTheme} ${btopThemeLocation}/rose-pine-${theme.rosePineVariant}.theme
    '';
  };
}
