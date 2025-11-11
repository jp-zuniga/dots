{
  inputs,
  pkgs,
  ...
}: let
  unstable = import inputs.nixpkgs-unstable {system = pkgs.stdenv.hostPlatform.system;};
in {
  programs.git = {
    config = import ./git-conf.nix;
    enable = true;
    lfs.enable = true;
    package = unstable.gitMinimal;
  };
}
