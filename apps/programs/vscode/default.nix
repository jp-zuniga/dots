{
  config,
  inputs,
  pkgs,
  ...
}: let
  vscodeConfLocation = config.users.users.jaq.home + "/.config/Code/User";
  vscodeConf = import ./vscode-conf.nix pkgs;
in {
  environment.systemPackages = with pkgs; [
    (vscode-with-extensions.override {
      vscodeExtensions = [
        vscode-extensions.aaron-bond.better-comments
        vscode-extensions.bbenoist.nix
        vscode-extensions.charliermarsh.ruff
        vscode-extensions.foxundermoon.shell-format
        vscode-extensions.kamadorueda.alejandra
        vscode-extensions.llvm-vs-code-extensions.vscode-clangd
        vscode-extensions.ms-python.python
        vscode-extensions.ms-python.vscode-pylance
        vscode-extensions.mvllow.rose-pine
        vscode-extensions.pkief.material-icon-theme
        vscode-extensions.pkief.material-product-icons
        vscode-extensions.tamasfe.even-better-toml
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
