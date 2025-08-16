################################
## custom defaults for eza/ls ##
################################

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
