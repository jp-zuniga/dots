{pkgs, ...}:
pkgs.writeShellScriptBin "custom-eza" ''
  set -euo pipefail

  declare -a args

  dir=""
  level=0
  recursive_count=0

  # parse args
  while [[ $# -gt 0 ]]; do
    case "$1" in
      --)
        # end of options
        shift
        break
        ;;
      --all)
        args+=("--all")
        ;;
      --long)
        args+=("-l" "-h")
        ;;
      --tree)
        args+=("--tree")
        level=1
        ;;
      --recursive)
        args+=("-R")
        recursive_count=$((recursive_count + 1))
        ;;

      # clustered short options, e.g. -atrrr
      -[!-]*)
        cluster="''${1#-}"
        for (( i=0; i<''${#cluster}; i++ )); do
          c="''${cluster:i:1}"
          case "$c" in
            a) args+=("-a") ;;
            l) args+=("-l" "-h") ;;
            t) args+=("--tree"); level=1 ;;
            r) args+=("-R"); recursive_count=$((recursive_count + 1)) ;;
            *)
              echo "Unknown option: -$c" >&2
              exit 1
              ;;
          esac
        done
        ;;
      -*)
        echo "Unknown flag: $1" >&2
        exit 1
        ;;
      *)
        if [[ -z "$dir" ]]; then
          dir="''${1/#\~/$HOME}"
        else
          echo "Unknown argument: $1" >&2
          exit 1
        fi
        ;;
    esac
    shift
  done

  # accept first positional after `--` as dir
  if [[ $# -gt 0 && -z "$dir" ]]; then
    dir="''${1/#\~/$HOME}"
  fi

  if (( recursive_count > 0 )); then
    level=$recursive_count
  fi

  common=(--color=always --color-scale=all --icons=auto
          --level="''${level}" --sort=type --git-ignore
          --group-directories-first)

  if [[ -z "$dir" ]]; then
    eza "''${args[@]}" "''${common[@]}"
  else
    eza "''${args[@]}" "''${common[@]}" -- "''${dir}"
  fi
''
