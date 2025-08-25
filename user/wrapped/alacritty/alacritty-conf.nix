{
  pkgs,
  theme,
}:
pkgs.writeText "alacritty.toml" ''
  [colors.primary]
  background = "${theme.bg}"
  bright_foreground = "${theme.text}"
  dim_foreground = "${theme.subtle}"
  foreground = "${theme.text}"

  [colors.cursor]
  cursor = "${theme.highlightHigh}"
  text = "${theme.text}"

  [colors.vi_mode_cursor]
  cursor = "${theme.highlightHigh}"
  text = "${theme.text}"

  [colors.search.matches]
  background = "${theme.overlay}"
  foreground = "${theme.subtle}"

  [colors.search.focused_match]
  background = "${theme.rose}"
  foreground = "${theme.bg}"

  [colors.hints.start]
  background = "${theme.surface}"
  foreground = "${theme.subtle}"

  [colors.hints.end]
  background = "${theme.surface}"
  foreground = "${theme.muted}"

  [colors.line_indicator]
  background = "None"
  foreground = "None"

  [colors.footer_bar]
  background = "${theme.surface}"
  foreground = "${theme.text}"

  [colors.selection]
  background = "${theme.highlightMed}"
  text = "${theme.text}"

  [colors.normal]
  black = "${theme.overlay}"
  blue = "${theme.foam}"
  cyan = "${theme.rose}"
  green = "${theme.pine}"
  magenta = "${theme.iris}"
  red = "${theme.love}"
  white = "${theme.text}"
  yellow = "${theme.gold}"

  [colors.bright]
  black = "${theme.muted}"
  blue = "${theme.foam}"
  cyan = "${theme.rose}"
  green = "${theme.pine}"
  magenta = "${theme.iris}"
  red = "${theme.love}"
  white = "${theme.text}"
  yellow = "${theme.gold}"

  [colors.dim]
  black = "${theme.muted}"
  blue = "${theme.foam}"
  cyan = "${theme.rose}"
  green = "${theme.pine}"
  magenta = "${theme.iris}"
  red = "${theme.love}"
  white = "${theme.text}"
  yellow = "${theme.gold}"

  [font]
  size = 12
''
