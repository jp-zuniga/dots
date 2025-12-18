{
  cursorSize,
  pkgs,
  ...
}: let
  variant = "moon";

  variantPalette = "${variant}Colors";

  palettes = {
    dawnColors = {
      foreground = "#575279";
      accent = "#f3eeea";
      base = "#faf4ed";
      black = "#f2e9e1";
      red = "#b4637a";
      green = "#286983";
      yellow = "#ea9d34";
      blue = "#56949f";
      magenta = "#907aa9";
      cyan = "#d7827e";
      white = "#575279";
    };

    moonColors = {
      foreground = "#e0def4";
      accent = "#2a273f";
      base = "#232136";
      black = "#393552";
      red = "#eb6f92";
      green = "#3e8fb0";
      yellow = "#f6c177";
      blue = "#9ccfd8";
      magenta = "#c4a7e7";
      cyan = "#ea9a97";
      white = "#e0def4";
    };

    pineColors = {
      foreground = "#e0def4";
      accent = "#1f1d2e";
      base = "#191724";
      black = "#26233a";
      red = "#eb6f92";
      green = "#31748f";
      yellow = "#f6c177";
      blue = "#9ccfd8";
      magenta = "#c4a7e7";
      cyan = "#ebbcba";
      white = "#e0def4";
    };
  };
in {
  inherit variant;

  colors = palettes.${variantPalette};

  cursor = {
    size = cursorSize;

    hypr = {
      name = "rose-pine-hyprcursor";
      package = pkgs.rose-pine-hyprcursor;
    };

    x = {
      name = "BreezeX-RosePine-Linux";
      package = pkgs.rose-pine-cursor;
    };
  };

  gtk = {
    name = "rose-pine-gtk";
    package = pkgs.rose-pine-gtk-theme;
  };
}
