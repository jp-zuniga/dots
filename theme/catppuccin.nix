{
  cursorSize,
  pkgs,
  ...
}: let
  variant = "mocha";

  variantCursor = "${variant}Dark";
  variantPalette = "${variant}Colors";

  cursorAttrs = {
    name = "catppuccin-cursors";
    package = pkgs.catppuccin-cursors.${variantCursor};
  };

  palettes = {
    frappeColors = {
      foreground = "#c6d0f5";
      accent = "#44495d";
      base = "#303446";
      black = "#51576d";
      red = "#e78284";
      green = "#a6d189";
      yellow = "#e5c890";
      blue = "#8caaee";
      magenta = "#f4b8e4";
      cyan = "#81c8be";
      white = "#a5adce";
    };

    latteColors = {
      foreground = "#4c4f69";
      accent = "#eff1f5";
      base = "#d8dae1";
      black = "#5c5f77";
      red = "#d20f39";
      green = "#40a02b";
      yellow = "#df8e1d";
      blue = "#1e66f5";
      magenta = "#ea76cb";
      cyan = "#179299";
      white = "#acb0be";
    };

    macchiatoColors = {
      foreground = "#cad3f5";
      accent = "#3a3e53";
      base = "#24273a";
      black = "#494d64";
      red = "#ed8796";
      green = "#a6da95";
      yellow = "#eed49f";
      blue = "#8aadf4";
      magenta = "#f5bde6";
      cyan = "#8bd5ca";
      white = "#a5adcb";
    };

    mochaColors = {
      foreground = "#cdd6f4";
      accent = "#353748";
      base = "#1e1e2e";
      black = "#45475a";
      red = "#f38ba8";
      green = "#a6e3a1";
      yellow = "#f9e2af";
      blue = "#89b4fa";
      magenta = "#f5c2e7";
      cyan = "#94e2d5";
      white = "#a6adc8";
    };
  };
in {
  inherit variant;

  colors = palettes.${variantPalette};

  cursor = {
    size = cursorSize;

    hypr = cursorAttrs;
    x = cursorAttrs;
  };

  gtk = {
    name = "catppuccin-gtk";
    package = pkgs.catppuccin-gtk;
  };
}
