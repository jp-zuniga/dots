{
  pkgs,
  theme,
  ...
}:
pkgs.writeText "config.fish" ''
  set -g fish_greeting ""

  # pick theme
  fish_config theme choose rose-pine-${theme.rosePineVariant}

  abbr --add --position anywhere -- --help '--help | bat -plhelp'
  abbr --add --position anywhere -- -h '-h | bat -plhelp'

  # init zoxide
  zoxide init --cmd cd fish | source

  # on boot
  if ! pgrep Hyprland > /dev/null
    # one-time ssh
    eval (ssh-agent -c)
    ssh-add ~/.ssh/id_ed25519

    # start graphical session
    hyprland > /dev/null
  end
''
