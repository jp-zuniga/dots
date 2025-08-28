pkgs: let
  base00 = "#232136";
  base01 = "#2a273f";
  base02 = "#393552";
  base03 = "#6e6a86";
  base04 = "#908caa";
  base05 = "#e0def4";
  base06 = "#eb6f92";
  base07 = "#f6c177";
  base08 = "#ea9a97";
  base09 = "#3e8fb0";
  base0A = "#9ccfd8";
  base0B = "#c4a7e7";
  base0C = "#f6c177";
  base0D = "#2a283e";
  base0E = "#44415a";
  base0F = "#56526e";
in {
  inherit
    base00
    base01
    base02
    base03
    base04
    base05
    base06
    base07
    base08
    base09
    base0A
    base0B
    base0C
    base0D
    base0E
    base0F
    ;

  bg = base00;
  surface = base01;
  overlay = base02;
  muted = base03;
  subtle = base04;
  text = base05;
  love = base06;
  gold = base07;
  rose = base08;
  pine = base09;
  foam = base0A;
  iris = base0B;
  highlightLow = base0D;
  highlightMed = base0E;
  highlightHigh = base0F;

  rosePineVariant = "moon";

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
