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

  if git diff --quiet "*.nix"; then
    read -p "No changes detected. Upgrade anyway? (y/N): " -n 1 -r
    echo

    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
      echo "Exiting." && exit 0
    fi

    echo "Proceeding with upgrade..."
  fi

  # autoformat
  alejandra -q . &> $F_LOG || (echo "Formatting failed!" && exit 1)

  # show changes
  git diff -U0 "*.nix"

  echo
  echo -n "Upgrading system..."

  echo && sudo nixos-rebuild switch --upgrade --max-jobs 1 --flake .#$HOST &> $S_LOG || (\
    cat $S_LOG | grep --color error && \
    notify-send --urgency=critical "NixOS upgrade failed!" && \
    exit 1 \
  )

  cd -
  notify-send "NixOS upgrade successful!"
''
