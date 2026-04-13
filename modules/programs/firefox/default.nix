{
  pkgs,
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
      textfox = pkgs.fetchFromGitHub {
        hash = "sha256-SL+uh4u43h+P1w5aZEQtnJ7WZyiFsnkM7GRv3JXTqaw=";
        owner = "adriankarlen";
        repo = "textfox";
        rev = "2449bec4ba919adf24396e378a5c9ae4405e77fd";
      };

      keybinds = pkgs.writeText "keybinds.json" (builtins.toJSON {key_quitApplication = {};});

      firefoxConfLocation = "${users.jaq.home}/.mozilla/firefox";
    in ''
      mkdir -p ${firefoxConfLocation}

      INI="${firefoxConfLocation}/profiles.ini"

      if [ -f "$INI" ]; then
        PROFILE_DIR=$(grep "^Path=" "$INI" | cut -d "=" -f2)

        FULL_PROFILE_PATH="${firefoxConfLocation}/$PROFILE_DIR"
        CHROME_PATH="$FULL_PROFILE_PATH/chrome"

        mkdir -p "$FULL_PROFILE_PATH"
        mkdir -p "$CHROME_PATH"

        ln -sf ${keybinds} "$FULL_PROFILE_PATH/customKeys.json"
        ln -sf ${textfox}/user.js "$FULL_PROFILE_PATH/user.js"

        cp -rf ${textfox}/chrome/* "$CHROME_PATH"

        chmod -R +w "$CHROME_PATH"

        echo "
        :root {
          --tf-display-sidebar-tools: none !important;
          --tf-display-titles: none !important;
        }

        box#vertical-tabs {
          min-width: 58px !important;
        }

        #back-button,
        #forward-button,
        #unified-extensions-button {
          display: none !important;
        }" >> "$FULL_PROFILE_PATH/chrome/userChrome.css"
      fi
    '';
  };
}
