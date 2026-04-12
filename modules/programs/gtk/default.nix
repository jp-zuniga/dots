{
  lib,
  pkgs,
  theme,
  ...
}: let
  toGtk3Ini = lib.generators.toINI {
    mkKeyValue = key: value: let
      value' =
        if builtins.isBool value
        then lib.boolToString value
        else builtins.toString value;
    in "${lib.escape ["="] key}=${value'}";
  };
in {
  homix = let
    colors = import ./colors.nix {inherit theme;};

    gtkINI = {
      gtk-application-prefer-dark-theme = 1;
      gtk-cursor-theme-name = theme.cursor.name;
      gtk-decoration-layout = "appmenu:none";
      gtk-error-bell = 0;
      gtk-font-name = "Noto 12";
      gtk-xft-antialias = 1;
      gtk-xft-hinting = 0;
      gtk-xft-hintstyle = "hintslight";
      gtk-xft-rgba = "rgb";
    };
  in {
    ".config/gtk-2.0/gtkrc".text = ''
      theme.gtk.name="${theme.gtk.name}"
      gtk-font-name="Noto 12"
      gtk-cursor-theme-name="${theme.cursor.name}"
      gtk-xft-antialias=1
      gtk-xft-hinting=0
      gtk-xft-hintstyle="hintslight"
      gtk-xft-rgba="rgb"
    '';

    ".config/gtk-3.0/gtk.css".text = colors;
    ".config/gtk-3.0/settings.ini".text = toGtk3Ini {
      Settings = gtkINI // {gtk-toolbar-style = "GTK_TOOLBAR_BOTH";};
    };

    ".config/gtk-4.0/gtk.css".text = colors;
    ".config/gtk-4.0/settings.ini".text = toGtk3Ini {
      Settings = gtkINI;
    };
  };

  environment = {
    systemPackages = [
      pkgs.glib
      pkgs.gsettings-desktop-schemas
      theme.cursor.package
      theme.gtk.package
    ];

    variables = {
      GTK_THEME = theme.gtk.name;
      GSK_RENDERER = "gl";
      GTK_USE_PORTAL = "1";
    };
  };
}
