{
  pkgs,
  theme,
  ...
}: let
  ezaTheme = let
    inherit (theme) colors;
  in {
    colourful = true;
    filekinds = {
      normal.foreground = colors.white;
      directory.foreground = colors.blue;
      symlink.foreground = colors.black;
      pipe.foreground = colors.foreground;
      block_device.foreground = colors.cyan;
      char_device.foreground = colors.yellow;
      socket.foreground = colors.accent;
      special.foreground = colors.magenta;
      executable.foreground = colors.magenta;
      mount_point.foreground = colors.black;
    };

    file_type = {
      image.foreground = colors.yellow;
      video.foreground = colors.red;
      music.foreground = colors.blue;
      lossless.foreground = colors.foreground;
      crypto.foreground = colors.black;
      document.foreground = colors.foreground;
      compressed.foreground = colors.magenta;
      temp.foreground = colors.cyan;
      compiled.foreground = colors.green;
      build.foreground = colors.foreground;
      source.foreground = colors.cyan;
      punctuation.foreground = colors.accent;
      date.foreground = colors.green;
      inode.foreground = colors.foreground;
      blocks.foreground = colors.black;
      header.foreground = colors.foreground;
      octal.foreground = colors.blue;
      flags.foreground = colors.magenta;
      symlink_path.foreground = colors.blue;
      control_char.foreground = colors.green;
      broken_symlink.foreground = colors.red;
      broken_path_overlay.foreground = colors.black;
    };

    git = {
      new.foreground = colors.blue;
      modified.foreground = colors.yellow;
      deleted.foreground = colors.red;
      renamed.foreground = colors.green;
      typechange.foreground = colors.magenta;
      ignored.foreground = colors.foreground;
      conflicted.foreground = colors.cyan;
    };

    git_repo = {
      branch_main.foreground = colors.foreground;
      branch_other.foreground = colors.magenta;
      git_clean.foreground = colors.blue;
      git_dirty.foreground = colors.red;
    };

    links = {
      normal.foreground = colors.blue;
      multi_link_file.foreground = colors.green;
    };

    perms = {
      user_read.foreground = colors.foreground;
      user_write.foreground = colors.black;
      user_execute_file.foreground = colors.magenta;
      user_execute_other.foreground = colors.magenta;
      group_read.foreground = colors.foreground;
      group_write.foreground = colors.black;
      group_execute.foreground = colors.magenta;
      other_read.foreground = colors.foreground;
      other_write.foreground = colors.black;
      other_execute.foreground = colors.magenta;
      special_user_file.foreground = colors.magenta;
      special_other.foreground = colors.black;
      attribute.foreground = colors.foreground;
    };

    security_context = {
      colon.foreground = colors.foreground;
      user.foreground = colors.blue;
      role.foreground = colors.magenta;
      typ.foreground = colors.foreground;
      range.foreground = colors.magenta;
    };

    size = {
      major.foreground = colors.foreground;
      minor.foreground = colors.blue;
      number_byte.foreground = colors.foreground;
      number_kilo.foreground = colors.black;
      number_mega.foreground = colors.green;
      number_giga.foreground = colors.magenta;
      number_huge.foreground = colors.magenta;
      unit_byte.foreground = colors.foreground;
      unit_kilo.foreground = colors.green;
      unit_mega.foreground = colors.magenta;
      unit_giga.foreground = colors.magenta;
      unit_huge.foreground = colors.blue;
    };

    users = {
      user_you.foreground = colors.yellow;
      user_root.foreground = colors.red;
      user_other.foreground = colors.magenta;
      group_yours.foreground = colors.black;
      group_other.foreground = colors.foreground;
      group_root.foreground = colors.red;
    };
  };
in
  pkgs.writeText "colors.yml" (builtins.toJSON ezaTheme)
