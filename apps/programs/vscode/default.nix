{
  config,
  inputs,
  pkgs,
  ...
}: let
  unstable = import inputs.nixpkgs-unstable {
    system = pkgs.stdenv.hostPlatform.system;
    config.allowUnfree = true;
  };

  vscodeConfLocation = config.users.users.jaq.home + "/.config/Code/User";
  vscodeConf = import ./vscode-conf.nix pkgs;
in {
  environment.systemPackages = [
    (pkgs.vscode-with-extensions.override {
      vscodeExtensions = [
        pkgs.vscode-extensions.adpyke.codesnap
        pkgs.vscode-extensions.aaron-bond.better-comments
        pkgs.vscode-extensions.bbenoist.nix
        pkgs.vscode-extensions.charliermarsh.ruff
        pkgs.vscode-extensions.foxundermoon.shell-format
        pkgs.vscode-extensions.kamadorueda.alejandra
        pkgs.vscode-extensions.llvm-vs-code-extensions.vscode-clangd
        pkgs.vscode-extensions.ms-python.python
        pkgs.vscode-extensions.ms-python.vscode-pylance
        pkgs.vscode-extensions.mvllow.rose-pine
        pkgs.vscode-extensions.pkief.material-icon-theme
        pkgs.vscode-extensions.pkief.material-product-icons
        pkgs.vscode-extensions.tamasfe.even-better-toml
        unstable.vscode-extensions.github.copilot
        unstable.vscode-extensions.github.copilot-chat
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
