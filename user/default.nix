{
  inputs,
  pkgs,
  ...
}: {
  environment.sessionVariables = {
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_DOCUMENTS_DIR = "$HOME/docs";
    XDG_DOWNLOAD_DIR = "$HOME/dwnlds";
    XDG_MUSIC_DIR = "$HOME/moosic";
    XDG_PICTURES_DIR = "$HOME/pics";
    XDG_STATE_HOME = "$HOME/.local/state";
  };

  imports = [
    ./eza
    ./firefox
    ./fish
    ./git
    ./gtk
    ./qt
    ./qbittorrent
    ./spotify
    ./starship
    ./steam
    ./vscode
    ./yazi

    ./packages.nix
    ./wrapped/btop/btop-theme.nix
  ];
}
