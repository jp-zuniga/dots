# stuff to install

{ config, lib, pkgs, ... }:

{
    programs.nix-ld.enable    = true;
    programs.nix-ld.libraries = with pkgs; [ ];

    programs.firefox.enable  = true;
    programs.hyprland.enable = true;
    programs.steam.enable    = {
        enable    = true;
        extraPkgs = pkgs: with pkgs; [
            rose-pine-cursor
            rose-pine-hyprcursor
        ];
    }

    nixpkgs.config.allowUnfree  = true;
    environment.defaultPackages = [ ];

    environment.systemPackages  = with pkgs; [
        alacritty
        astroterm
        bacon
        bat
        brightnessctl
        btop
        cbonsai
        delta
        discord
        eza
        gimp3
        git
        hyprcursor
        hypridle
        hyprlock
        hyprpicker
        hyprpolkitagent
        hyprshot
        hyprsunset
        libnotify
        libreoffice-qt6-fresh
        mako
        microfetch
        mprocs
        mpv
        ncspot
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
        rose-pine-cursor
        rose-pine-hyprcursor
        tokei
        udiskie
        uv
        vscode.fhs
        waybar
        yazi
    ];

    environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
