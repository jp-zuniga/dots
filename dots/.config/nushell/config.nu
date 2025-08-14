# setup starship:
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

# load env and custom config:
source  $nu.env-path
source ($nu.default-config-dir | path join "aliases.nu")
source ($nu.default-config-dir | path join "cmds.nu")
