{
  pkgs,
  theme,
  ...
}:
pkgs.writeText "config.fish" ''
  set -g fish_greeting ""

  # pick theme
  fish_config theme choose rose-pine-${theme.rosePineVariant}

  # on boot
  if ! pgrep Hyprland > /dev/null
    # one-time ssh
    eval (ssh-agent -c)
    ssh-add ~/.ssh/id_ed25519

    # start graphical session
    hyprland > /dev/null
  end
''
