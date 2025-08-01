# setup starship prompt:
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

# load env and custom config:
source $"~/.config/nushell/env.nu"
source $"~/.config/nushell/aliases.nu"
source $"~/.config/nushell/cmds.nu"
