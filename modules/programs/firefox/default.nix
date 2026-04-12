{
  pkgs,
  theme,
  users,
  ...
}: {
  programs.firefox = {
    enable = true;
    policies = import ./policies.nix {inherit users;};
    preferences = import ./preferences.nix;
    preferencesStatus = "locked";
  };

  system.activationScripts.firefoxSetup = {
    deps = [];
    text = let
      cascadeTheme = pkgs.fetchFromGitHub {
        owner = "cascadefox";
        repo = "cascade";
        rev = "8700d7718d130023815f0b036f3b1c4aaa2d5392";
        hash = "sha256-uGC+SIRisABvulJcpiHwE4mhhwzMVtpo3RMJEJoCaPU=";
      };

      customKeys = "customKeys.json";

      keys.key_quitApplication = {};

      firefoxConf = pkgs.writeText customKeys (builtins.toJSON keys);
      firefoxConfLocation = "${users.jaq.home}/.mozilla/firefox";
    in ''
      mkdir -p ${firefoxConfLocation}

      INI="${firefoxConfLocation}/profiles.ni"

      if [ -f "$INI" ]; then
        PROFILE_DIR=$(grep "^Path=" "$INI" | cut -d "=" -f2)

        FULL_PROFILE_PATH="${firefoxConfLocation}/$PROFILE_DIR"

        mkdir -p "$FULL_PROFILE_PATH"
        mkdir -p "$FULL_PROFILE_PATH/chrome"

        ln -sf ${firefoxConf} "$FULL_PROFILE_PATH/${customKeys}"
        ln -sf ${cascadeTheme}/chrome/* "$FULL_PROFILE_PATH/chrome"
        ln -sf ${cascadeTheme}/integrations/catppuccin/* "$FULL_PROFILE_PATH/chrome/includes"

        sed -i 's|@import "includes/cascade-colours.css";|@import "includes/cascade-${theme.variant}.css";|' "${cascadeTheme}/chrome/userChrome.css"
      fi
    '';
  };
}
