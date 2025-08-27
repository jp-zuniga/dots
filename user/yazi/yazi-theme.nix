{
  pkgs,
  theme,
  ...
}: {
  flavor = {
    dark = "rose-pine-${theme.rosePineVariant}";
    light = "rose-pine-${theme.rosePineVariant}";
  };
}
