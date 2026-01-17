{
  flake,
  pkgs,
  theme,
  ...
}: let
  yaziTheme.flavor = {
    dark = "rose-pine-${theme.rosePineVariant}";
    light = "rose-pine-${theme.rosePineVariant}";
  };
in
  pkgs.writeText "theme.toml" (flake.lib.toTOML yaziTheme)
