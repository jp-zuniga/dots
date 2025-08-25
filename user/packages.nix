{pkgs}: {
  # ! missing: rofi, vscode, steam (with cursor fix), btop, firefox, yazi
  # ? libreoffice cursor fix?

  environment.systemPackages = builtins.attrValues {
    inherit
      (pkgs)
      delta
      discord
      dotter
      gimp3
      hyprpicker
      hyprpolkitagent
      hyprshot
      libnotify
      libreoffice-fresh
      microfetch
      mpv
      pastel
      prismlauncher
      swww
      qview
      uv
      unzip
      zip
      ;
  };

  extraSetup = ''
    rm $out/share/applications/Alacritty.desktop
    rm $out/share/applications/base.desktop
    rm $out/share/applications/btop.desktop
    rm $out/share/applications/code-url-handler.desktop
    rm $out/share/applications/cups.desktop
    rm $out/share/applications/draw.desktop
    rm $out/share/applications/fish.desktop
    rm $out/share/applications/math.desktop
    rm $out/share/applications/mpv.desktop
    rm $out/share/applications/nixos-manual.desktop
    rm $out/share/applications/rofi.desktop
    rm $out/share/applications/rofi-theme-selector.desktop
    rm $out/share/applications/yazi.desktop
    sed -i 's/^Name=GNU Image Manipulation Program$/Name=GIMP/' $out/share/applications/gimp.desktop
  '';
}
