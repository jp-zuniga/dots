# {
#   config,
#   lib,
#   pkgs,
# }: let
  # gracias steam por:
  steam-cursor = pkgs.runCommandLocal "steam-cursor" {} ''
    mkdir -p $out/share/icons
    ln -s ${pkgs.rose-pine-cursor}/share/icons/BreezeX-RosePine-Linux $out/share/icons/default
  '';
# in {
#   environment = {
#     defaultPackages = [];
#     systemPackages = with pkgs; [
      # alacritty
      # alejandra
      # astroterm
      # bacon
      # bat
      # brightnessctl
      btop
      # cbonsai
      # cowsay
      # delta
      # discord
      # dotter
      # eza
      # fortune-kind
      # gimp3
      # git
      # hypridle
      # hyprlock
      # hyprpicker
      # hyprpolkitagent
      # hyprshot
      # libnotify
      # libreoffice-qt6-fresh
      # mako
      # microfetch
      # mpv
      # pastel
      # pipes-rs
      (rofi-wayland.overrideAttrs (prevAttrs: {
        postInstall =
          (prevAttrs.postInstall or "")
          + ''
            rm $out/share/applications/rofi.desktop
            rm $out/share/applications/rofi-theme-selector.desktop
          '';
      }))
      # rose-pine-cursor
      # rose-pine-hyprcursor
      # rustup
      # sccache
      # starship
      # swww
      # qbittorrent
      # qview
      # uv
      vscode.fhs
      # waybar
      yazi
    # ];

    # sessionVariables.NIXOS_OZONE_WL = "1"; # electron compatibility

    # customize rofi drun entries
    # extraSetup = ''
    #   rm $out/share/applications/Alacritty.desktop
    #   rm $out/share/applications/base.desktop
    #   rm $out/share/applications/btop.desktop
    #   rm $out/share/applications/code-url-handler.desktop
    #   rm $out/share/applications/cups.desktop
    #   rm $out/share/applications/draw.desktop
    #   rm $out/share/applications/fish.desktop
    #   rm $out/share/applications/math.desktop
    #   rm $out/share/applications/mpv.desktop
    #   rm $out/share/applications/nixos-manual.desktop
    #   rm $out/share/applications/rofi.desktop
    #   rm $out/share/applications/rofi-theme-selector.desktop
    #   rm $out/share/applications/yazi.desktop
    #   sed -i 's/^Name=GNU Image Manipulation Program$/Name=GIMP/' $out/share/applications/gimp.desktop
    # '';
  # };

  # programs = {
    firefox.enable = true;
    # fish.enable = true;
    # hyprland.enable = true;
    # nh.enable = true;

    steam = {
      enable = true;
      extraPackages = with pkgs; [steam-cursor];
    # };
  # };
# }
