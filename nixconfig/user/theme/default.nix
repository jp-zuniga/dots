pkgs: {
  opacity = 1.0;
  background = "232136"; # base
  text = "e0def4";

  regular = {
    background = "2a273f"; # surface
    red = "eb6f92"; # love
    green = "3e8fb0"; # pine
    yellow = "f6c177"; # gold
    blue = "9ccfd8"; # foam
    purple = "c4a7e7"; # iris
    cyan = "ea9a97"; # rose
    white = "e0def4"; # text
  };

  bright = {
    background = "393552"; # overlay
    white = "e0def4"; # text
    cyan = "ea9a97"; # rose
    purple = "c4a7e7"; # iris
    blue = "3e8fb0";
    yellow = "f6c177"; # gold
    green = "3e8fb0"; # pine
    red = "eb6f92"; # love
  };

  base00 = "232136"; # base
  base01 = "2a273f"; # surface
  base02 = "393552"; # overlay
  base03 = "6e6a86"; # !muted
  base04 = "908caa"; # !subtle
  base05 = "e0def4"; # text
  base06 = "eb6f92"; # love
  base07 = "f6c177"; # gold
  base08 = "ea9a97"; # rose
  base09 = "3e8fb0"; # pine
  base0A = "9ccfd8"; # foam
  base0B = "c4a7e7"; # iris
  base0C = "f6c177"; # gold
  base0D = "2a283e"; # !highlight-low
  base0E = "44415a"; # !highlight-med
  base0F = "56526e"; # !highlight-high

  accent = "c4a7e7"; # iris

  bat = "rose-pine-moon";

  cursor = {
    hypr = {
      package = pkgs.rose-pine-hyprcursor;
      name = "rose-pine-hyprcursor";
    };

    x = {
      package = pkgs.rose-pine-cursor;
      name = "BreezeX-RoséPine";
    };
  };

  gtk = {
    enable = true;
    package = pkgs.rose-pine-gtk-theme;
    name = "rose-pine-gtk";
  };
}
