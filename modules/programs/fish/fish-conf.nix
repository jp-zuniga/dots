{
  pkgs,
  theme,
  ...
}: let
  denv = "${pkgs.direnv}/bin/direnv";
  star = "${pkgs.starship}/bin/starship";
  zox = "${pkgs.zoxide}/bin/zoxide";
in
  pkgs.writeText "config.fish" ''
    set -g fish_greeting ""

    fish_config theme choose ${theme.kebabName}

    abbr --add --position anywhere -- --help '--help | bat -plhelp'
    abbr --add --position anywhere -- -h '-h | bat -plhelp'

    ${denv} hook fish | source
    ${zox} init --cmd cd fish | source

    if not set -q SSH_AUTH_SOCK
      eval (ssh-agent -c)
      ssh-add ~/.ssh/id_ed25519
    end

    if set -q HYPRLAND_INSTANCE_SIGNATURE
      ${star} init fish | source
    end
  ''
