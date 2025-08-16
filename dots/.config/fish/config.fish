# remove greeting
set -g fish_greeting ""

# init prompt
starship init fish | source

# pick theme
fish_config theme choose rose-pine-moon

abbr --add rebuild sudo nixos-rebuild

# git aliases
abbr --add g    git
abbr --add ga   git add
abbr --add gb   git branch
abbr --add gc   git commit
abbr --add gcm  git commit -m
abbr --add gco  git config
abbr --add gcl  git clone
abbr --add gch  git checkout
abbr --add gd   git diff
abbr --add gf   git fetch --all -t
abbr --add gi   git init
abbr --add gl   git log --graph --pretty=format:'%C(magenta)%h%C(white) - %an - %C(yellow)%ar%C(auto) - %D%n%s'
abbr --add gp   git push
abbr --add gpf  git push --force-with-lease
abbr --add gpl  git pull
abbr --add gs   git status --short
abbr --add gsh  git show --pretty=format:'%C(magenta)%h%C(white) - %an - %C(yellow)%ar%C(auto) - %D%n%s'
abbr --add gst  git stash
abbr --add gsw  git switch

function custom-eza --description "Call eza with custom defaults"
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
                   --level=$level --sort=type --group-directories-first \
                   --no-permissions --no-user
    else
        eza $flags --color=always --color-scale=all --icons=auto \
                   --level=$level --sort=type --group-directories-first \
                   --no-permissions --no-user "$dir"
    end
end

abbr --add ls custom-eza -a
abbr --add ll custom-eza -al
abbr --add lt custom-eza -alt
abbr --add lr custom-eza -altr
