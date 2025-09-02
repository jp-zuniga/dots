{
  pkgs,
  theme,
  ...
}: {
  programs.firefox = {
    enable = true;
    policies = import ./policies.nix {inherit pkgs theme;};
    preferences = import ./preferences.nix;
  };
}
