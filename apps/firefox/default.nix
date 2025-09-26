{
  config,
  pkgs,
  theme,
  ...
}: {
  programs.firefox = {
    enable = true;
    policies = import ./policies.nix {inherit config pkgs theme;};
    preferences = import ./preferences.nix;
    preferencesStatus = "locked";
  };
}
