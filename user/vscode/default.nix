{
  config,
  inputs,
  pkgs,
  ...
}: let
  unstable = import inputs.nixpkgs-unstable {
    system = "x86_64-linux";
    config.allowUnfree = true;
  };

  vscodeConfLocation = config.users.users.jaq.home + "/.config/Code/User";
  vscodeConf = import ./vscode-conf.nix pkgs;
in {
  environment.systemPackages = with pkgs; [
    (vscode-with-extensions.override {
      vscodeExtensions = [
        vscode-extensions.adpyke.codesnap
        vscode-extensions.aaron-bond.better-comments
        vscode-extensions.bbenoist.nix
        vscode-extensions.charliermarsh.ruff
        vscode-extensions.kamadorueda.alejandra
        vscode-extensions.llvm-vs-code-extensions.vscode-clangd
        vscode-extensions.ms-python.python
        vscode-extensions.ms-python.vscode-pylance
        vscode-extensions.mvllow.rose-pine
        vscode-extensions.pkief.material-icon-theme
        vscode-extensions.pkief.material-product-icons
        vscode-extensions.tamasfe.even-better-toml
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
