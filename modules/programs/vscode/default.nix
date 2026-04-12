{
  pkgs,
  theme,
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
    #     vsc-pkgs.bierner.markdown-preview-github-styles
    #     vsc-pkgs.catppuccin.catppuccin-vsc
    #     vsc-pkgs.catppuccin.catppuccin-vsc-icons
    #     vsc-pkgs.charliermarsh.ruff
    #     vsc-pkgs.editorconfig.editorconfig
    #     vsc-pkgs.esbenp.prettier-vscode
    #     vsc-pkgs.jnoortheen.nix-ide
    #     vsc-pkgs.kamadorueda.alejandra
    #     vsc-pkgs.llvm-vs-code-extensions.vscode-clangd
    #     vsc-pkgs.mkhl.shfmt
    #     vsc-pkgs.ms-python.python
    #     vsc-pkgs.ms-python.vscode-pylance
    #     vsc-pkgs.nefrob.vscode-just-syntax
    #     vsc-pkgs.pkief.material-icon-theme
    #     vsc-pkgs.pkief.material-product-icons
    #     vsc-pkgs.rust-lang.rust-analyzer
    #     vsc-pkgs.tamasfe.even-better-toml
    #     vsc-pkgs.timonwong.shellcheck
    #     vsc-pkgs.usernamehw.errorlens
    #   ];
    # })
  ];

  system.activationScripts.vscodeSetup = {
    deps = [];
    text = let
      vscodeConfLocation = "${users.jaq.home}/.config/Code/User";
      vscodeConf = import ./vscode-conf.nix {inherit pkgs theme;};
    in ''
      mkdir -p ${vscodeConfLocation}

      ln -sf ${vscodeConf} ${vscodeConfLocation}/settings.json
    '';
  };
}
