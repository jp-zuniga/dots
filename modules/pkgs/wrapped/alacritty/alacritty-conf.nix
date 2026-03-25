{
  flake,
  pkgs,
  theme,
  ...
}: let
  settings = {
    colors = {
      bright = {
        black = theme.muted;
        blue = theme.foam;
        cyan = theme.rose;
        green = theme.pine;
        magenta = theme.iris;
        red = theme.love;
        white = theme.text;
        yellow = theme.gold;
      };

      cursor = {
        cursor = theme.highlightHigh;
        text = theme.text;
      };

      dim = {
        black = theme.muted;
        blue = theme.foam;
        cyan = theme.rose;
        green = theme.pine;
        magenta = theme.iris;
        red = theme.love;
        white = theme.text;
        yellow = theme.gold;
      };

      hints = {
        end = {
          background = theme.surface;
          foreground = theme.muted;
        };

        start = {
          background = theme.surface;
          foreground = theme.subtle;
        };
      };

      footer_bar = {
        background = theme.surface;
        foreground = theme.text;
      };

      line_indicator = {
        background = "None";
        foreground = "None";
      };

      normal = {
        black = theme.overlay;
        blue = theme.foam;
        cyan = theme.rose;
        green = theme.pine;
        magenta = theme.iris;
        red = theme.love;
        white = theme.text;
        yellow = theme.gold;
      };

      primary = {
        background = theme.bg;
        bright_foreground = theme.text;
        dim_foreground = theme.subtle;
        foreground = theme.text;
      };

      search = {
        focused_match = {
          background = theme.rose;
          foreground = theme.bg;
        };

        matches = {
          background = theme.overlay;
          foreground = theme.subtle;
        };
      };

      selection = {
        background = theme.highlightMed;
        text = theme.text;
      };

      vi_mode_cursor = {
        cursor = theme.highlightHigh;
        text = theme.text;
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
