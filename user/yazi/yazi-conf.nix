{pkgs, ...}: {
  mgr = {
    ratio = [0 4 4];
    linemode = "size";
    sort_by = "size";
    sort_dir_first = true;
    sort_sensitive = true;
    show_symlink = true;
    sort_reverse = false;
  };

  preview = {
    wrap = "no";
    tab_size = 4;
    image_delay = 500;
    image_filter = "nearest";
    image_quality = 75;
    max_height = 1000;
    max_width = 1000;
  };
}
