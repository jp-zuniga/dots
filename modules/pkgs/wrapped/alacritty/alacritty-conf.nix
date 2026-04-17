{
  colors,
  flake,
  pkgs,
  ...
}: let
  settings = {
    colors = let
      palette = colors;
      alacrittyColors = builtins.removeAttrs palette ["accent" "base" "foreground"];
    in {
      bright = alacrittyColors;

      cursor = {
        cursor = palette.black;
        text = palette.base;
      };

      dim = alacrittyColors;

      footer_bar = {
        background = palette.base;
        foreground = palette.white;
      };

      hints = {
        end = {
          background = palette.white;
          foreground = palette.base;
        };

        start = {
          background = palette.yellow;
          foreground = palette.base;
        };
      };

      indexed_colors = [
        {
          color = palette.yellow;
          index = 16;
        }
        {
          color = palette.magenta;
          index = 17;
        }
      ];

      line_indicator = {
        background = "None";
        foreground = "None";
      };

      normal = alacrittyColors;

      primary = {
        inherit (palette) foreground;

        background = palette.base;
        bright_foreground = palette.foreground;
        dim_foreground = palette.white;
      };

      search = {
        focused_match = {
          background = palette.base;
          foreground = palette.green;
        };

        matches = {
          background = palette.base;
          foreground = palette.white;
        };
      };

      selection = {
        background = palette.white;
        text = palette.base;
      };

      vi_mode_cursor = {
        cursor = palette.cyan;
        text = palette.base;
      };
    };

    env.TERM = "xterm-256color";
    font.size = 12;

    window = {
      decorations = "None";
      padding.x = 10;
    };
  };
in
  pkgs.writeText "alacritty.toml" (flake.lib.toTOML settings)
