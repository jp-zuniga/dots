{
  pkgs,
  theme,
  ...
}: let
  btopTheme = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/rose-pine/btop/main/rose-pine-${theme.rosePineVariant}.theme";
    hash = "sha256-iJNhWAQ6xzl6EsI0wWxtN14/KqZ7YWZFJaqFOZjLO8g=";
  };

  btopConf = import ./btop-conf.nix {inherit pkgs btopTheme;};
in
  pkgs.symlinkJoin {
    name = "btop-wrapped";
    paths = [pkgs.btop];
    buildInputs = [pkgs.makeWrapper];
    postBuild = ''
      wrapProgram $out/bin/btop --add-flags "--config ${btopConf}"
    '';
  }
