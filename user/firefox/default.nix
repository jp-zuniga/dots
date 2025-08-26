{
  config,
  inputs,
  lib,
  pkgs,
  theme,
  ...
}: {
  programs.firefox = {
    enable = true;
    policies = import ./policies.nix {inherit lib pkgs theme;};
    preferences = import ./preferences.nix;
  };

  system.activationScripts.firefoxSetup = ''
    for PROFILE_DIR in ${config.users.users.jaq.home}/.mozilla/firefox/*.default; do
      if [ -d "$PROFILE_DIR" ]; then
        mkdir -p "$PROFILE_DIR/chrome"
        cp -fr ${inputs.firefoxTheme}/dist/* "$PROFILE_DIR/chrome/"
      fi
    done
  '';
}
