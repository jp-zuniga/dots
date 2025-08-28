{pkgs, ...}: {
  qt = {
    enable = true;
    platformTheme = "qt5ct";
    style = {
      package = pkgs.rose-pine-kvantum;
      name = "kvantum";
    };
  };
}
