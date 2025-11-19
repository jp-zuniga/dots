{
  config,
  pkgs,
  ...
}: let
  vscodeConfLocation = config.users.users.jaq.home + "/.config/Code/User";
  vscodeConf = import ./vscode-conf.nix pkgs;
in {
  environment.systemPackages = [
    (pkgs.vscode-with-extensions.override {
      vscodeExtensions = [
        pkgs.vscode-extensions.bbenoist.nix
        pkgs.vscode-extensions.bierner.markdown-mermaid
        pkgs.vscode-extensions.bierner.markdown-preview-github-styles
        pkgs.vscode-extensions.charliermarsh.ruff
        pkgs.vscode-extensions.davidanson.vscode-markdownlint
        pkgs.vscode-extensions.foxundermoon.shell-format
        pkgs.vscode-extensions.kamadorueda.alejandra
        pkgs.vscode-extensions.llvm-vs-code-extensions.vscode-clangd
        pkgs.vscode-extensions.ms-python.python
        pkgs.vscode-extensions.ms-python.vscode-pylance
        pkgs.vscode-extensions.nefrob.vscode-just-syntax
        pkgs.vscode-extensions.mvllow.rose-pine
        pkgs.vscode-extensions.pkief.material-icon-theme
        pkgs.vscode-extensions.pkief.material-product-icons
        pkgs.vscode-extensions.rust-lang.rust-analyzer
        pkgs.vscode-extensions.tamasfe.even-better-toml
        pkgs.vscode-extensions.yzhang.markdown-all-in-one
      ];
    })
  ];

  system.activationScripts.vscodeSetup = {
    deps = [];
    text = ''
      mkdir -p ${vscodeConfLocation}
      ln -sf ${vscodeConf} ${vscodeConfLocation}/settings.json
    '';
  };
}
