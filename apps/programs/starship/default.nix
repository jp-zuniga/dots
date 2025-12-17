{theme, ...}: {
  programs.starship = {
    enable = true;
    settings = import ./star-conf.nix {inherit theme;};
  };
}
