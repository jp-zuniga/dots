{pkgs, ...}:
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

  if git diff --quiet "*.nix"; then
    read -p "No changes detected. Rebuild anyway? (y/N): " -n 1 -r

    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
      echo "Exiting." && exit 0
    fi

    echo -en "\nProceeding with rebuild..."
  fi

  # autoformat
  alejandra -q . &> $F_LOG || (echo "Formatting failed!" && exit 1)

  # show changes
  git diff "*.nix"

  echo -en "\nRebuilding system..."

  sudo nixos-rebuild switch --flake .#$HOST &> $S_LOG || (\
    cat $S_LOG | grep --color error && \
    notify-send --urgency=critical "Rebuild failed!" && \
    exit 1 \
  )

  cd - > /dev/null
  notify-send "Rebuild successful!"
''
