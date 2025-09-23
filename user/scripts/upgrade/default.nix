{pkgs, ...}:
pkgs.writeShellScriptBin "upgrade" ''
  # Based on the work of 0atman:
  # - https://gist.github.com/0atman/1a5133b842f929ba4c1e195ee67599d5
  # ------------------------------------------------------------------

  CONFIG=$HOME/dots
  HOST=$(hostname)

  F_LOG=~/.nixos-format.log
  S_LOG=~/.nixos-switch.log

  set -e

  cd $CONFIG

  # exit if the configuration hasn't changed
  if git diff --quiet "*.nix"; then
    echo "No changes detected, exiting." && exit 0
  fi

  # autoformat
  alejandra -q . &> $F_LOG || (echo "Formatting failed!" && exit 1)

  # show changes
  git diff -U0 "*.nix"

  echo
  echo -n "Rebuilding system..."

  echo && sudo nixos-rebuild switch --upgrade --max-jobs 1 --flake .#$HOST &> $S_LOG || (\
    cat $S_LOG | grep --color error && \
    notify-send --urgency=critical "NixOS rebuild failed!" && \
    exit 1 \
  )

  cd -
  notify-send "NixOS rebuild successful!"
''
