{
  pkgs,
  theme,
  ...
}: let
  fishTheme = pkgs.writeText "${theme.rosePineVariant}.fish" ''
    set -g fish_color_normal ${theme.text}
    set -g fish_color_command ${theme.accent}
    set -g fish_color_keyword ${theme.regular.blue}
    set -g fish_color_quote ${theme.regular.yellow}
    set -g fish_color_redirection ${theme.regular.green}
    set -g fish_color_end ${theme.base04}
    set -g fish_color_error ${theme.regular.red}
    set -g fish_color_param ${theme.regular.cyan}
    set -g fish_color_comment ${theme.base04}
    set -g fish_color_selection --reverse
    set -g fish_color_operator ${theme.text}
    set -g fish_color_escape ${theme.regular.green}
    set -g fish_color_autosuggestion ${theme.base04}
    set -g fish_color_cwd ${theme.regular.cyan}
    set -g fish_color_user ${theme.regular.yellow}
    set -g fish_color_host ${theme.regular.blue}
    set -g fish_color_host_remote ${theme.accent}
    set -g fish_color_cancel ${theme.text}
    set -g fish_color_search_match --background=${theme.background}
    set -g fish_color_valid_path

    set -g fish_pager_color_progress ${theme.regular.cyan}
    set -g fish_pager_color_background --background=${theme.regular.background}
    set -g fish_pager_color_prefix ${theme.regular.blue}
    set -g fish_pager_color_completion ${theme.base04}
    set -g fish_pager_color_description ${theme.base04}
    set -g fish_pager_color_secondary_background
    set -g fish_pager_color_secondary_prefix
    set -g fish_pager_color_secondary_completion
    set -g fish_pager_color_secondary_description
    set -g fish_pager_color_selected_background --background=${theme.bright.background}
    set -g fish_pager_color_selected_prefix ${theme.regular.blue}
    set -g fish_pager_color_selected_completion ${theme.text}
    set -g fish_pager_color_selected_description ${theme.text}

    set -g fish_color_subtle ${theme.base04}
    set -g fish_color_text ${theme.text}
    set -g fish_color_love ${theme.regular.red}
    set -g fish_color_gold ${theme.regular.yellow}
    set -g fish_color_rose ${theme.regular.cyan}
    set -g fish_color_pine ${theme.regular.green}
    set -g fish_color_foam ${theme.regular.blue}
    set -g fish_color_iris ${theme.accent}
  '';
in {
  programs.fish = {
    enable = true;
    shellInit = ''
      set -g fish_greeting ""

      source ${fishTheme}

      # init starship for gui terminals
      if pgrep alacritty > /dev/null || pgrep code > /dev/null
          starship init fish | source
      end

      # autostart hyprland on boot
      if ! pgrep Hyprland > /dev/null
          hyprland > /dev/null
      end

      #############################
      ## parse custom functions: ##
      #############################

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
    '';

    shellAbbrs = {
      # nix aliases
      rebuild = "/home/jaq/dots/scripts/rebuild.sh";
      ale = "alejandra -q .";

      # git aliases
      g = "git";
      ga = "git add";
      gb = "git branch";
      gc = "git commit";
      gcm = "git commit -m";
      gco = "git config";
      gcl = "git clone";
      gch = "git checkout";
      gd = "git diff";
      gf = "git fetch --all -t";
      gi = "git init";
      gp = "git push";
      gpf = "git push --force-with-lease";
      gpl = "git pull";
      gs = "git status --short";
      gst = "git stash";
      gsw = "git switch";

      # eza/ls aliases
      e = "custom-eza";
      ea = "custom-eza -a";
      el = "custom-eza -al";
      et = "custom-eza -at";
      er = "custom-eza -atr";
    };
  };
}
