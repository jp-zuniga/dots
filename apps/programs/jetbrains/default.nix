{
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./idea.nix
    ./rider.nix
  ];
}
