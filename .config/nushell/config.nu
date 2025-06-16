# load env and custom commands:
source $"~/.config/nushell/env.nu"
source $"~/.config/nushell/cmds.nu"

# setup starship prompts:
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

###############################################################################

# alias sky  = astroterm -Ccu --speed 100 --fps 360 --aspect-ratio 4.0
alias tree = cbonsai -li --time=0.1

alias core-echo   = echo
alias core-open   = open
alias core-ls     = ls
alias core-gcc    = gcc
alias ghostscript = gs

alias echo = ^echo
alias open = ^open
alias read = bat

alias ls   = eza-wrapper -a
alias ll   = eza-wrapper -al
alias lt   = eza-wrapper -alt

alias ga   = git add
alias gb   = git branch

alias gc   = git commit -m
alias gca  = git commit -am

alias gcl  = git clone
alias gch  = git checkout
alias gd   = git diff --output-indicator-new=' ' --output-indicator-old=' '
alias gf   = git fetch --all -t
alias gi   = git init
alias gl   = git log --all --graph --pretty=format:'%C(magenta)%h%C(white) - %an - %C(yellow)%ar%C(auto) - %D%n%s'

alias gp   = git push
alias gpl  = git pull

alias gr   = git remote
alias gra  = git remote add
alias grr  = git remote remove
alias grv  = git remote -v

alias gs   = git status --short
alias gsh  = git show --pretty=format:'%C(magenta)%h%C(white) - %an - %C(yellow)%ar%C(auto) - %D%n%s'
alias gst  = git stash
alias gsw  = git switch

###############################################################################
