{
  flake.nixosModules = {
    cursor = ./cursor.nix;
    eza = ./eza;
    firefox = ./firefox;
    fish = ./fish;
    git = ./git;
    gtk = ./gtk;
    jetbrains = ./jetbrains;
    prismlauncher = ./prismlauncher.nix;
    qbittorrent = ./qbittorrent.nix;
    qt = ./qt.nix;
    spicetify = ./spicetify.nix;
    starship = ./starship;
    steam = ./steam.nix;
    sunsetr = ./sunsetr;
    vscode = ./vscode;
    yazi = ./yazi;
  };
}
