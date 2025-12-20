{unstable, ...}: {
  programs.git = {
    config = import ./git-conf.nix;
    enable = true;
    lfs.enable = true;
    package = unstable.gitMinimal.override {
      withManual = true;
    };
  };
}
