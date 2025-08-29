{
  inputs,
  lib,
  pkgs,
  theme,
  ...
}: {
  environment.systemPackages = [
    pkgs.spotify
  ];

  imports = [inputs.spicetify-nix.nixosModules.default];

  programs.spicetify = let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  in {
    enable = true;
    theme = spicePkgs.themes.text;

    colorScheme = let
      capitalize = str: let
        firstChar = lib.substring 0 1 str;
        rest = lib.substring 1 (lib.stringLength str - 1) str;
      in
        lib.toUpper firstChar + rest;
    in let
      themeVariant = capitalize theme.rosePineVariant;
    in "RosePine${themeVariant}";
  };
}
