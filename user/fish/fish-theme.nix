{
  pkgs,
  theme,
  ...
}:
pkgs.writeText "rose-pine${theme.rosePineVariant}.fish" ''
  set -g fish_color_normal ${theme.text}
  set -g fish_color_command ${theme.iris}
  set -g fish_color_keyword ${theme.foam}
  set -g fish_color_quote ${theme.gold}
  set -g fish_color_redirection ${theme.pine}
  set -g fish_color_end ${theme.subtle}
  set -g fish_color_error ${theme.love}
  set -g fish_color_param ${theme.rose}
  set -g fish_color_comment ${theme.subtle}
  set -g fish_color_selection --reverse
  set -g fish_color_operator ${theme.text}
  set -g fish_color_escape ${theme.pine}
  set -g fish_color_autosuggestion ${theme.subtle}
  set -g fish_color_cwd ${theme.rose}
  set -g fish_color_user ${theme.gold}
  set -g fish_color_host ${theme.foam}
  set -g fish_color_host_remote ${theme.iris}
  set -g fish_color_cancel ${theme.text}
  set -g fish_color_search_match --background=${theme.bg}
  set -g fish_color_valid_path

  set -g fish_pager_color_progress ${theme.rose}
  set -g fish_pager_color_background --background=${theme.surface}
  set -g fish_pager_color_prefix ${theme.foam}
  set -g fish_pager_color_completion ${theme.subtle}
  set -g fish_pager_color_description ${theme.subtle}
  set -g fish_pager_color_secondary_background
  set -g fish_pager_color_secondary_prefix
  set -g fish_pager_color_secondary_completion
  set -g fish_pager_color_secondary_description
  set -g fish_pager_color_selected_background --background=${theme.overlay}
  set -g fish_pager_color_selected_prefix ${theme.foam}
  set -g fish_pager_color_selected_completion ${theme.text}
  set -g fish_pager_color_selected_description ${theme.text}

  set -g fish_color_subtle ${theme.subtle}
  set -g fish_color_text ${theme.text}
  set -g fish_color_love ${theme.love}
  set -g fish_color_gold ${theme.gold}
  set -g fish_color_rose ${theme.rose}
  set -g fish_color_pine ${theme.pine}
  set -g fish_color_foam ${theme.foam}
  set -g fish_color_iris ${theme.iris}
''
