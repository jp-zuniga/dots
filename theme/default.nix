{pkgs, ...}: {
  rosePineVariant = "moon";

  bg = "#232136";
  surface = "#2a273f";
  overlay = "#393552";
  muted = "#6e6a86";
  subtle = "#908caa";
  text = "#e0def4";
  love = "#eb6f92";
  rose = "#ea9a97";
  gold = "#f6c177";
  foam = "#9ccfd8";
  pine = "#3e8fb0";
  iris = "#c4a7e7";
  highlightLow = "#2a283e";
  highlightMed = "#44415a";
  highlightHigh = "#56526e";

  cursor = {
    hypr = {
      name = "rose-pine-hyprcursor";
      package = pkgs.rose-pine-hyprcursor;
    };

    size = "30";
    x = {
      name = "BreezeX-RosePine-Linux";
      package = pkgs.rose-pine-cursor;
    };
  };

  gtk = {
    name = "rose-pine-gtk";
    package = pkgs.rose-pine-gtk-theme;
  };
}
