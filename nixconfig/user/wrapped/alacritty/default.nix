{
  pkgs,
  theme,
}: let
  config = pkgs.writeText "alacritty.toml" ''
    [colors.primary]
    background = "${theme.background}"
    bright_foreground = "${theme.text}"
    dim_foreground = "${theme.base04}"
    foreground = "${theme.text}"

    [colors.cursor]
    cursor = "${theme.base0F}"
    text = "${theme.text}"

    [colors.vi_mode_cursor]
    cursor = "${theme.base0F}"
    text = "${theme.text}"

    [colors.search.matches]
    background = "${theme.bright.background}"
    foreground = "${theme.base04}"

    [colors.search.focused_match]
    background = "${theme.regular.cyan}"
    foreground = "${theme.background}"

    [colors.hints.start]
    background = "${theme.regular.background}"
    foreground = "${theme.base04}"

    [colors.hints.end]
    background = "${theme.regular.background}"
    foreground = "${theme.base03}"

    [colors.line_indicator]
    background = "None"
    foreground = "None"

    [colors.footer_bar]
    background = "${theme.regular.background}"
    foreground = "${theme.text}"

    [colors.selection]
    background = "${theme.base0E}"
    text = "${theme.text}"

    [colors.normal]
    black = "${theme.bright.background}"
    blue = "${theme.regular.blue}"
    cyan = "${theme.regular.cyan}"
    green = "${theme.regular.green}"
    magenta = "${theme.accent}"
    red = "${theme.regular.red}"
    white = "${theme.text}"
    yellow = "${theme.regular.yellow}"

    [colors.bright]
    black = "${theme.base03}"
    blue = "${theme.regular.blue}"
    cyan = "${theme.regular.cyan}"
    green = "${theme.regular.green}"
    magenta = "${theme.accent}"
    red = "${theme.regular.red}"
    white = "${theme.text}"
    yellow = "${theme.regular.yellow}"

    [colors.dim]
    black = "${theme.base03}"
    blue = "${theme.regular.blue}"
    cyan = "${theme.regular.cyan}"
    green = "${theme.regular.green}"
    magenta = "${theme.accent}"
    red = "${theme.regular.red}"
    white = "${theme.text}"
    yellow = "${theme.regular.yellow}"

    [font]
    size = 12
  '';
in
  pkgs.symlinkJoin {
    name = "alacritty-wrapped";
    paths = [pkgs.alacritty];
    buildInputs = [pkgs.makeWrapper];
    postBuild = ''
      wrapProgram $out/bin/alacritty --add-flags "--config-file ${config}"
    '';
  }
