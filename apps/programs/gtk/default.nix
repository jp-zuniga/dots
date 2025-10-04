{
  inputs,
  lib,
  pkgs,
  theme,
  ...
}: let
  inherit (builtins) toString isBool;
  inherit (lib) boolToString escape generators optionalAttrs;

  gtk-theme-name = theme.gtk.name;
  toGtk3Ini = generators.toINI {
    mkKeyValue = key: value: let
      value' =
        if isBool value
        then boolToString value
        else toString value;
    in "${escape ["="] key}=${value'}";
  };
in {
  homix = let
    colors = import ./colors.nix {inherit theme;};
    gtkINI = {
      inherit gtk-theme-name;
      gtk-application-prefer-dark-theme = 1;
      gtk-font-name = "Noto 12";
      gtk-icon-theme-name = "rose-pine";
      gtk-xft-antialias = 1;
      gtk-xft-hinting = 0;
      gtk-xft-hintstyle = "hintslight";
      gtk-xft-rgba = "rgb";
      gtk-cursor-theme-name = theme.cursor.x.name;
    };
  in {
    ".config/gtk-3.0/gtk.css".text = colors;
    ".config/gtk-3.0/settings.ini".text = toGtk3Ini {
      Settings = gtkINI;
    };

    ".config/gtk-4.0/gtk.css".text = colors;
    ".config/gtk-4.0/settings.ini".text = toGtk3Ini {
      Settings =
        gtkINI
        // {
          gtk-application-prefer-dark-theme = 1;
        };
    };
  };

  environment = {
    systemPackages = [
      pkgs.rose-pine-icon-theme
      theme.cursor.x.package
      theme.gtk.package
    ];

    variables = {
      GTK_THEME = gtk-theme-name;
      GSK_RENDERER = "gl";
      HYPRCURSOR_THEME = theme.cursor.hypr.name;
      HYPRCURSOR_SIZE = theme.cursor.size;
      XCURSOR_THEME = theme.cursor.x.name;
      XCURSOR_SIZE = theme.cursor.size;
    };
  };
}
