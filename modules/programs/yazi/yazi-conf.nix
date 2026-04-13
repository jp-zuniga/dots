{
  flake,
  pkgs,
  ...
}: let
  settings = {
    mgr = {
      linemode = "size";
      ratio = [1 4 4];
      show_symlink = true;
      sort_by = "size";
      sort_dir_first = true;
      sort_sensitive = true;
      sort_reverse = false;
    };

    preview = {
      image_delay = 50;
      image_filter = "nearest";
      image_quality = 75;
      max_height = 1000;
      max_width = 1000;
      tab_size = 4;
      wrap = "no";
    };
  };
in
  pkgs.writeText "yazi.toml" (flake.lib.toTOML settings)
