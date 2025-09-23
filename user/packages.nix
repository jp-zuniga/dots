{pkgs, ...}: {
  environment = {
    systemPackages = let
      theme = import ./theme pkgs;
    in [
      pkgs.alejandra
      pkgs.brightnessctl
      pkgs.brillo
      pkgs.clang-tools
      pkgs.delta
      pkgs.discord
      pkgs.dust
      pkgs.gimp3
      pkgs.hyprpicker
      pkgs.hyprpolkitagent
      pkgs.hyprshot
      pkgs.libnotify
      pkgs.libreoffice-fresh
      pkgs.microfetch
      pkgs.mpv
      pkgs.pastel
      pkgs.playerctl
      pkgs.swww
      pkgs.qview
      pkgs.uv
      pkgs.jetbrains.idea-ultimate

      (import ./scripts/focus pkgs)
      (import ./scripts/random-wall pkgs)
      (import ./scripts/rebuild pkgs)
      (import ./scripts/upgrade pkgs)
      (pkgs.callPackage ./scripts/system-cursor {inherit pkgs theme;})
      (pkgs.callPackage ./wrapped/alacritty {inherit theme;})
      (pkgs.callPackage ./wrapped/bat {inherit theme;})
      (pkgs.callPackage ./wrapped/btop {inherit theme;})
      (pkgs.callPackage ./wrapped/hypr {inherit theme;})
      (pkgs.callPackage ./wrapped/mako {inherit theme;})
      (pkgs.callPackage ./wrapped/rofi {inherit theme;})
      (pkgs.callPackage ./wrapped/waybar {inherit theme;})
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

  programs = {
    hyprland.enable = true;
    java = {
      enable = true;
      package = pkgs.jdk17;
    };
  };
}
