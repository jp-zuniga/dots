{
  flake.nixosModules = {
    cursor = ./cursor.nix;
    direnv = ./direnv.nix;
    eza = ./eza;
    firefox = ./firefox;
    fish = ./fish;
    git = ./git;
    gtk = ./gtk;
    jetbrains = ./jetbrains.nix;
    libreoffice = ./libreoffice.nix;
    packages = ./packages.nix;
    prismlauncher = ./prismlauncher.nix;
    qbittorrent = ./qbittorrent.nix;
    qt = ./qt.nix;
    starship = ./starship;
    steam = ./steam.nix;
    sunsetr = ./sunsetr;
    vscode = ./vscode;
    yazi = ./yazi;
  };
}
