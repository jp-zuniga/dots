{pkgs, ...}:
pkgs.writeShellScriptBin "custom-eza" ''
  set -euo pipefail

  dir=""
  flags="-"
  level=0
  recursive_count=0

  while [[ $# -gt 0 ]]; do
    case "$1" in
      -a | --all)
        flags="''${flags}a"
        ;;
      -l | --long)
        flags="''${flags}hl"
        ;;
      -t | --tree)
        flags="''${flags}T"
        level=1
        ;;
      -r | --recursive)
        flags="''${flags}R"
        recursive_count=$((recursive_count + 1))
        ;;
      *)
          if [[ -z "$dir" ]]; then
            # expandir ~
            dir="''${1/#\~/$HOME}"
          else
            echo "Unkown argument: $1" >&2
            exit 1
          fi
          ;;
      esac
    shift
  done

  if [[ $recursive_count -gt 0 ]]; then
    level=$recursive_count
  fi

  if [[ -z "$dir" ]]; then
    eza $flags --color=always --color-scale=all --icons=auto \
               --level=$level --sort=type --git-ignore \
               --group-directories-first
  else
    eza $flags --color=always --color-scale=all --icons=auto \
               --level=$level --sort=type --git-ignore \
               --group-directories-first "$dir"
  fi
''
