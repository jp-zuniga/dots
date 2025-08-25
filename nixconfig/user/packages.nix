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
      gimp3
      libreoffice-fresh
      microfetch
      mpv
      prismlauncher
      unzip
      zip
      ;
  };
}
