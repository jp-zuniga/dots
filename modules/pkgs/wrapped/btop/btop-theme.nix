{
  pkgs,
  theme,
  users,
  ...
}: {
  system.activationScripts.btopSetup = {
    deps = [];
    text = let
      btopThemeLocation = "${users.jaq.home}/.config/btop/themes";
      btopTheme = pkgs.fetchurl {
        hash = "sha256-THRpq5vaKCwf9gaso3ycC4TNDLZtBB5Ofh/tOXkfRkQ=";
        url = "${theme.rawGithub}/btop/main/themes/${theme.snakeName}.theme";
      };
    in ''
      mkdir -p ${btopThemeLocation}

      ln -sf ${btopTheme} ${btopThemeLocation}/${theme.snakeName}.theme
    '';
  };
}
