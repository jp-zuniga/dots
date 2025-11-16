{
  config,
  lib,
  pkgs,
  theme,
  ...
}: let
  fishConf = import ./fish-conf.nix {inherit pkgs theme;};
  fishTheme = pkgs.fetchurl {
    hash = "sha256-WUCByT9bdqKGkWxoxUG184ZY51oczCfe06Fkj/iz7HE=";
    url = let
      capitalize = str: let
        firstChar = lib.substring 0 1 str;
        rest = lib.substring 1 (lib.stringLength str - 1) str;
      in
        lib.toUpper firstChar + rest;
    in let
      themeVariant = capitalize theme.rosePineVariant;
    in "https://raw.githubusercontent.com/rose-pine/fish/main/themes/Rosé%20Pine%20${themeVariant}.theme";
  };

  fishLocation = config.users.users.jaq.home + "/.config/fish";
  themeLocation = "${fishLocation}/themes";
in {
  programs.fish = {
    enable = true;
    generateCompletions = false;
    shellAbbrs = {
      ale = "alejandra -q .";
      e = "custom-eza";
      ea = "custom-eza -a";
      el = "custom-eza -al";
      et = "custom-eza -at";
      er = "custom-eza -atr";
      g = "git";
      ga = "git add";
      gb = "git branch";
      gc = "git commit";
      gcm = "git commit -m";
      gco = "git config";
      gcl = "git clone";
      gch = "git checkout";
      gd = "git diff";
      gf = "git fetch --all -t";
      gi = "git init";
      gl = "git log --graph --pretty=format:'%C(magenta)%h%C(white) - %an - %C(yellow)%ar%C(auto) - %D%n%s'";
      gm = "git merge";
      gp = "git push";
      gpf = "git push --force-with-lease";
      gpl = "git pull";
      grb = "git rebase";
      grt = "git remote";
      gra = "git remote add";
      grao = "git remote add origin";
      grr = "git remote remove";
      grro = "git remote remove origin";
      grv = "git remote -v";
      gs = "git status --short";
      gst = "git stash";
      gsh = "git show --pretty=format:'%n%C(magenta)%h%C(white) - %an - %C(yellow)%ar%C(auto) - %D%n%s'";
      gsw = "git switch";
      gu = "git rm --cached";
      gur = "git rm -r --cached";
      lines = "nix-shell -p tokei --run tokei";
      rfc = "uv tool run ruff check";
      rff = "uv tool run ruff format";
    };
  };

  system.activationScripts.fishSetup = {
    deps = [];
    text = ''
      mkdir -p ${fishLocation} ${themeLocation}
      ln -sf ${fishConf} ${fishLocation}/config.fish
      ln -sf ${fishTheme} ${themeLocation}/rose-pine-${theme.rosePineVariant}.theme
    '';
  };
}
