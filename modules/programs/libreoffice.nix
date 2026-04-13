{
  pkgs,
  theme,
  users,
  ...
}: {
  environment.systemPackages = [pkgs.libreoffice-qt-fresh];

  system.activationScripts.libreofficeSetup = {
    deps = [];
    text = let
      confLocation = "${users.jaq.home}/.config/libreoffice/*/user";
      officeTheme = pkgs.fetchurl {
        hash = "sha256-sWw4ZE4Ke8FsrjESuyDt0zigy3dgE7KDApiO9AJUFwA=";
        url = "${theme.rawGithub}/libreoffice/main/themes/${theme.variant}/sapphire/${theme.kebabName}-sapphire.soc";
      };
    in ''
      DIR=$(realpath ${confLocation})

      mkdir -p "$DIR" "$DIR/config/themes"

      THEME="$DIR/config/themes/${theme.kebabName}-sapphire.soc"

      ln -sf ${officeTheme} "$THEME"

      FILE=$(realpath "$DIR/registrymodifications.xcu")

      NEW="$(head -n $(($(wc < "$FILE" -l) - 1)) "$FILE" && cat "$THEME" && tail -n1 "$FILE")"

      echo "$NEW" > "$FILE"
    '';
  };
}
