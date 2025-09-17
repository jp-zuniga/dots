{
  pkgs,
  config,
  ...
}: let
  vscodeConfLocation = config.users.users.jaq.home + "/.config/Code/User";
  vscodeConf = import ./vscode-conf.nix pkgs;
in {
  environment.systemPackages = with pkgs; [
    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
        adpyke.codesnap
        aaron-bond.better-comments
        bbenoist.nix
        charliermarsh.ruff
        kamadorueda.alejandra
        llvm-vs-code-extensions.vscode-clangd
        ms-python.python
        ms-python.vscode-pylance
        mvllow.rose-pine
        pkief.material-icon-theme
        pkief.material-product-icons
        tamasfe.even-better-toml
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
