{
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
      urlName = builtins.replaceStrings [" "] ["%20"] theme.name + ".tmTheme";

      confLocation = "${users.jaq.home}/.config/yazi";

      batTheme = pkgs.fetchurl {
        hash = "sha256-OVVm8IzrMBuTa5HAd2kO+U9662UbEhVT8gHJnCvUqnc=";
        name = "${theme.kebabName}.tmTheme";
        url = "${theme.rawGithub}/bat/main/themes/${urlName}.tmTheme";
      };

      rawYaziTheme = pkgs.fetchurl {
        hash = "sha256-16wu6FNgXnKIqchJfFfSR7+iOCF3NrRFD/Vbe/maPyc=";
        url = "${theme.rawGithub}/yazi/main/themes/${theme.variant}/${theme.kebabName}-sapphire.toml";
      };

      yaziTheme = pkgs.runCommand "patched-${theme.kebabName}-sapphire.toml" {} ''
        cp ${rawYaziTheme} $out

        chmod +w $out

        OLD=$(grep -m 1 '^syntect_theme *=' "$out" | cut -d '"' -f 2)

        NEW=$(echo "$OLD" | sed -E 's/([a-z])([A-Z])/\1-\2/g; s/[ _]+/-/g' | tr '[:upper:]' '[:lower:]')

        sed -i -E "s|^syntect_theme *=.*|syntect_theme = \"$NEW\"|" "$out"
      '';

      yaziConf = import ./yazi-conf.nix {inherit flake pkgs;};
    in ''
      mkdir -p ${confLocation}

      ln -sf ${batTheme} ${confLocation}/${theme.kebabName}.tmTheme
      ln -sf ${yaziConf} ${confLocation}/yazi.toml
      ln -sf ${yaziTheme} ${confLocation}/theme.toml
    '';
  };
}
