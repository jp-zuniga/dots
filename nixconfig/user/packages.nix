{
  pkgs,
  inputs,
  ...
}: let
  inherit (builtins) attrValues;
in {
  environment.systemPackages = attrValues {
    inherit
      (pkgs)
      eza
      # fzf
      gimp3
      libreoffice-fresh
      microfetch
      mpv
      prismlauncher
      # ripgrep
      unzip
      # zoxide
      ;
  };
}
