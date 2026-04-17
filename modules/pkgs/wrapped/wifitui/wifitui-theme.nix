{
  colors,
  flake,
  pkgs,
  ...
}: let
  theme = {
    Border = [colors.white colors.accent];
    Disabled = [colors.white colors.black];
    Error = [colors.red colors.red];
    Normal = [colors.black colors.foreground];
    Primary = [colors.yellow colors.yellow];
    Saved = [colors.blue colors.blue];
    Success = [colors.green colors.green];
    Subtle = [colors.white colors.white];
    SignalHigh = [colors.cyan colors.cyan];
    SignalLow = [colors.magenta colors.magenta];
    AccessPointIcon = "";
    NetworkOpenIcon = " ";
    NetworkSavedIcon = " ";
    NetworkSecureIcon = " ";
    NetworkUnknownIcon = " ";
    TitleIcon = "󰖩 ";
  };
in
  pkgs.writeText "theme.toml" (flake.lib.toTOML theme)
