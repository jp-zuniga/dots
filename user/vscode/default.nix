{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
        adpyke.codesnap
        aaron-bond.better-comments
        bbenoist.nix
        charliermarsh.ruff
        kamadorueda.alejandra
        ms-python.python
        ms-python.vscode-pylance
        mvllow.rose-pine
        pkief.material-icon-theme
        pkief.material-product-icons
        tamasfe.even-better-toml
      ];
    })
  ];
}
