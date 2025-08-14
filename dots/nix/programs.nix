# stuff to install

{ config, lib, pkgs, ... }: let
    # gracias steam por:
    steam-cursor = pkgs.runCommandLocal "steam-cursor" { } ''
        mkdir -p $out/share/icons
        ln -s ${pkgs.bibata-cursors}/share/icons/Bibata-Original-Classic $out/share/icons/default
    '';
in {
    environment = {
        defaultPackages = [ ];

        systemPackages  = with pkgs; [
            alacritty
            astroterm
            bacon
            bat
            bibata-cursors
            brightnessctl
            btop
            cbonsai
            delta
            dotter
            eza
            gimp3
            git
            hypridle
            hyprlock
            hyprpicker
            hyprpolkitagent
            hyprshot
            libnotify
            mako
            microfetch
            mpv
            nushell
            pastel
            rofi-wayland
            rustup
            sccache
            spotify
            starship
            swww
            qbittorrent
            qview
            uv
            vscode.fhs
            waybar
            yazi
        ];

        sessionVariables.NIXOS_OZONE_WL = "1";
    };

    programs = {
        firefox.enable  = true;
        hyprland.enable = true;

        steam = {
            enable        = true;
            extraPackages = with pkgs; [ steam-cursor ];
        };
    };
}
