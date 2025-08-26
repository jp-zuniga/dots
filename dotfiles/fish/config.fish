# remove greeting
set -g fish_greeting ""

# pick theme
fish_config theme choose rose-pine-moon

# init prompt only if a gui terminal is running (to avoid setting prompt in tty)
if pgrep alacritty > /dev/null || pgrep code > /dev/null
    starship init fish | source
end

# nix aliases
abbr --add rebuild /home/jaq/dots/dotfiles/nix/scripts/rebuild.sh
abbr --add ale alejandra -q .

# git aliases
abbr --add g    git
abbr --add ga   git add
abbr --add gb   git branch
abbr --add gc   git commit
abbr --add gcm  git commit    -m
abbr --add gco  git config
abbr --add gcl  git clone
abbr --add gch  git checkout
abbr --add gd   git diff
abbr --add gf   git fetch     --all -t
abbr --add gi   git init
abbr --add gp   git push
abbr --add gpf  git push      --force-with-lease
abbr --add gpl  git pull
abbr --add gs   git status    --short
abbr --add gst  git stash
abbr --add gsw  git switch

function gl --description "'git log' with custom default arguments"
    git log --graph --pretty=format:'%C(magenta)%h%C(white) - %an - %C(yellow)%ar%C(auto) - %D%n%s'
end

function gsh --description "'git show' with custom default arguments"
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

# eza/ls aliases
abbr --add e  custom-eza
abbr --add ea custom-eza -a
abbr --add el custom-eza -al
abbr --add et custom-eza -at
abbr --add er custom-eza -atr

# fun stuff
# abbr --add sky  astroterm -Ccu --speed 100 --fps 360 --aspect-ratio 4.0
# abbr --add tree cbonsai   -li  --time=0.1

# autostart hyprland (only on boot)
if ! pgrep Hyprland > /dev/null
    hyprland > /dev/null
end
