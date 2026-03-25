{
  pkgs,
  users,
  ...
}: {
  environment.systemPackages = [
    pkgs.vscode-fhs

    # (pkgs.vscode-with-extensions.override {
    #   vscodeExtensions = let
    #     vsc-pkgs = pkgs.vscode-extensions;
    #   in [
    #     vsc-pkgs.astral-sh.ty
    #     vsc-pkgs.bbenoist.nix
    #     vsc-pkgs.bierner.markdown-preview-github-styles
    #     vsc-pkgs.charliermarsh.ruff
    #     vsc-pkgs.editorconfig.editorconfig
    #     vsc-pkgs.esbenp.prettier-vscode
    #     vsc-pkgs.kamadorueda.alejandra
    #     vsc-pkgs.llvm-vs-code-extensions.vscode-clangd
    #     vsc-pkgs.ms-python.python
    #     vsc-pkgs.ms-python.vscode-pylance
    #     vsc-pkgs.mvllow.rose-pine
    #     vsc-pkgs.nefrob.vscode-just-syntax
    #     vsc-pkgs.pkief.material-icon-theme
    #     vsc-pkgs.pkief.material-product-icons
    #     vsc-pkgs.rust-lang.rust-analyzer
    #     vsc-pkgs.tamasfe.even-better-toml
    #     vsc-pkgs.usernamehw.errorlens
    #   ];
    # })
  ];

  system.activationScripts.vscodeSetup = {
    deps = [];
    text = let
      vscodeConfLocation = "${users.jaq.home}/.config/Code/User";
      vscodeConf = import ./vscode-conf.nix {inherit pkgs;};
    in ''
      mkdir -p ${vscodeConfLocation}

      ln -sf ${vscodeConf} ${vscodeConfLocation}/settings.json
    '';
  };
}
