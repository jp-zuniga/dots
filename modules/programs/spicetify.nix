{
  flake,
  inputs,
  pkgs,
  theme,
  ...
}: let
  spicetify = inputs.spicetify-nix;
  sys = pkgs.stdenv.hostPlatform.system;
in {
  imports = [spicetify.nixosModules.default];

  programs.spicetify = let
    spicePkgs = spicetify.legacyPackages.${sys};
  in {
    colorScheme = let
      themeVariant = flake.lib.capitalize theme.rosePineVariant;
    in "RosePine${themeVariant}";

    enable = true;
    theme = spicePkgs.themes.text;
  };
}
