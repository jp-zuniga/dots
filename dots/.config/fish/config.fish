# remove greeting
set -g fish_greeting ""

# init prompt
starship init fish | source

# pick theme
fish_config theme choose rose-pine-moon

# lazy rebuild
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
abbr --add gf   git fetch  --all -t
abbr --add gi   git init
abbr --add gl   git log    --graph --pretty=format:'%C(magenta)%h%C(white) - %an - %C(yellow)%ar%C(auto) - %D%n%s'
abbr --add gp   git push
abbr --add gpf  git push   --force-with-lease
abbr --add gpl  git pull
abbr --add gs   git status --short
abbr --add gsh  git show   --pretty=format:'%C(magenta)%h%C(white) - %an - %C(yellow)%ar%C(auto) - %D%n%s'
abbr --add gst  git stash
abbr --add gsw  git switch

# eza/ls aliases
abbr --add ls custom-eza -a
abbr --add ll custom-eza -al
abbr --add lt custom-eza -alt
abbr --add lr custom-eza -altr

# fun stuff
abbr --add sky  astroterm -Ccu --speed 100 --fps 360 --aspect-ratio 4.0
abbr --add tree cbonsai   -li  --time=0.1
