{
  pkgs,
  theme,
  ...
}:
pkgs.writeText "theme.toml" ''
  [flavor]
  dark = "rose-pine-${theme.rosePineVariant}"
  light = "rose-pine-${theme.rosePineVariant}"
''
