{
  pkgs,
  theme,
  ...
}:
pkgs.writeText "config.fish" ''
  set -g fish_greeting ""

  # pick theme
  fish_config theme choose rose-pine-${theme.rosePineVariant}

  # autostart hyprland on boot
  if ! pgrep Hyprland > /dev/null
    hyprland > /dev/null
  end

  # set-up ssh agent
  if pidof alacritty > /dev/null || pidof code > /dev/null
    eval (ssh-agent -c)
    ssh-add ~/.ssh/id_ed25519
  end

  #######################
  ## custom functions: ##
  #######################

  function gl --description "'git log' with custom defaults"
    git log --graph --pretty=format:'%C(magenta)%h%C(white) - %an - %C(yellow)%ar%C(auto) - %D%n%s'
  end

  function gsh --description "'git show' with custom defaults"
    git show --pretty=format:'%C(magenta)%h%C(white) - %an - %C(yellow)%ar%C(auto) - %D%n%s'
  end

  function custom-eza --description "eza with custom defaults"
    set -l dir ""
    set -l flags "-"
    set -l level 0

    argparse 'a/all' 'l/long' 't/tree' 'r/recursive' -- $argv
    or return

    if set -q _flag_all
      set flags "$flags"a
    end

    if set -q _flag_long
      set flags "$flags"hl
    else
      set flags "$flags"x
    end

    if set -q _flag_tree
      set flags "$flags"T
      set level 1
    end

    if set -q _flag_recursive
      set flags "$flags"R
      set level 2
    end

    if set -q argv[1]
      set dir (string replace --all '~' $HOME "$argv[1]")
    end

    if test -z "$dir"
        eza $flags --color=always --color-scale=all --icons=auto \
                   --level=$level --sort=type --git-ignore \
                   --group-directories-first
    else
        eza $flags --color=always --color-scale=all --icons=auto \
                   --level=$level --sort=type --git-ignore \
                   --group-directories-first "$dir"
    end
  end
''
