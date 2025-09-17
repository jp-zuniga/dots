{
  pkgs,
  theme,
  ...
}: {
  environment = {
    systemPackages =
      builtins.attrValues {
        inherit
          (pkgs)
          alejandra
          brightnessctl
          brillo
          clang-tools
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
          playerctl
          swww
          qview
          uv
          ;
      }
      ++ [
        pkgs.jetbrains.idea-ultimate
        (pkgs.runCommandLocal "system-cursor-theme" {} ''
          mkdir -p $out/share/icons
          ln -s ${theme.cursor.x.package}/share/icons/BreezeX-RosePine-Linux $out/share/icons/default
        '')
      ];

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
      rm $out/share/applications/startcenter.desktop
      rm $out/share/applications/yazi.desktop

      sed -i 's/GNU Image Manipulation Program/GIMP/' $out/share/applications/gimp.desktop
      sed -i 's/IntelliJ IDEA/IDEA/' $out/share/applications/idea-ultimate.desktop
      sed -i 's/LibreOffice Calc/Calc/' $out/share/applications/calc.desktop
      sed -i 's/LibreOffice Impress/Impress/' $out/share/applications/impress.desktop
      sed -i 's/LibreOffice Writer/Writer/' $out/share/applications/writer.desktop
      sed -i 's/Virtual Machine Manager/VM Manager/' $out/share/applications/virt-manager.desktop
      sed -i 's/Visual Studio Code/Code/' $out/share/applications/code.desktop
    '';
  };
}
