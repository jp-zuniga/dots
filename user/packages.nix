{pkgs, ...}: {
  environment = {
    systemPackages = builtins.attrValues {
      inherit (pkgs.jetbrains) idea-community;
      inherit
        (pkgs)
        alejandra
        brightnessctl
        brillo
        delta
        discord
        dust
        gimp3
        hyprpicker
        hyprpolkitagent
        hyprshot
        libnotify
        libreoffice-fresh
        microfetch
        mpv
        pastel
        swww
        qview
        uv
        unzip
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
      rm $out/share/applications/impress.desktop
      rm $out/share/applications/math.desktop
      rm $out/share/applications/mpv.desktop
      rm $out/share/applications/nixos-manual.desktop
      rm $out/share/applications/yazi.desktop
      sed -i 's/^GNU Image Manipulation Program$/GIMP/' $out/share/applications/gimp.desktop
      sed -i 's/^IntelliJ IDEA CE$/IDEA/' $out/share/applications/idea-community.desktop
    '';
  };
}
