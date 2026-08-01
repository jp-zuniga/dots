{
  pkgs,
  theme,
  ...
}: let
  awww = "${pkgs.awww}/bin/awww";
in
  pkgs.writeShellScriptBin "random-wall" ''
    mkdir -p ~/.cache

    WALL_DIR=$HOME/wallpapers/dots/${theme.kebabName}

    RANDOM_FLAVOR=$(\
      find "$WALL_DIR" -type d -name ".git" -prune -o -type d -print | \
      shuf -n 1 \
    )

    RANDOM_WALL=$(\
      find "$RANDOM_FLAVOR" -path "*/.git" -prune -o -type f -print | \
      shuf -n 1 \
    )

    ln -sf "$RANDOM_WALL" ~/.cache/.current-wall

    ${awww} img "$RANDOM_WALL" \
      --transition-type any \
      --transition-duration 0.5 \
      --transition-fps 120
  ''
