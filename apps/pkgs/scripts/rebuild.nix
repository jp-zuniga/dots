# originally written by: 0atman
#   - author: https://github.com/0atman
#   - source: https://gist.github.com/0atman/1a5133b842f929ba4c1e195ee67599d5
#
# licensed under: n/a
#   - no license was provided by author
#   - its inclusion in this repository is licensed under the GPLv3
#   - license: https://github.com/jp-zuniga/dots/blob/main/LICENSE
#
# changes:
#   - minor qol and code-style adjustments to fit my preferences
#
# ---------------------------------------------------------------------------------------
{pkgs, ...}: let
  ale = "${pkgs.alejandra}/bin/alejandra";
  git = "${pkgs.git}/bin/git";
  notify = "${pkgs.libnotify}/bin/notify-send";
in
  pkgs.writeShellScriptBin "rebuild" ''
    # Based on the work of 0atman:
    # - https://gist.github.com/0atman/1a5133b842f929ba4c1e195ee67599d5
    # ------------------------------------------------------------------

    CONFIG=$HOME/dev/dots
    HOST=$(hostname)

    F_LOG=~/.nixos-format.log
    S_LOG=~/.nixos-switch.log

    set -e

    cd $CONFIG

    if ${git} diff --quiet "*.nix"; then
      read -p "No changes detected. Rebuild anyway? (y/N): " -n 1 -r

      if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Exiting." && exit 0
      fi

      echo -en "\nProceeding with rebuild..."
    fi

    # autoformat
    ${ale} -q . &> $F_LOG || (echo "Formatting failed!" && exit 1)

    # show changes
    ${git} diff "*.nix"

    echo -en "\nRebuilding system..."

    sudo nixos-rebuild switch --flake .#$HOST &> $S_LOG || (\
      cat $S_LOG | grep --color error && \
      ${notify} --urgency=critical "Rebuild failed!" && \
      exit 1 \
    )

    cd - > /dev/null
    ${notify} "Rebuild successful!"
  ''
