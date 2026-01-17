{
  unstable,
  users,
  ...
}: {
  programs.git = {
    config = import ./git-conf.nix {inherit users;};
    enable = true;
    lfs.enable = true;
    package = unstable.gitMinimal.override {
      withManual = true;
    };
  };
}
