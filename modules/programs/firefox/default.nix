{users, ...}: {
  programs.firefox = {
    enable = true;
    policies = import ./policies.nix {inherit users;};
    preferences = import ./preferences.nix;
    preferencesStatus = "locked";
  };
}
