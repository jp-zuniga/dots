{
  pkgs,
  theme,
  users,
  ...
}: {
  programs.fish = {
    enable = true;
    shellAbbrs = {
      ale = "alejandra -q .";
      bm = "batman";
      e = "cza";
      ea = "cza -a";
      el = "cza -al";
      et = "cza -at";
      er = "cza -atr";
      start = "hyprland > /dev/null 2>&1";

      g = "git";
      ga = "git add";
      gb = "git branch";
      gc = "git commit";
      gca = "git commit -am";
      gcm = "git commit -m";
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
      gu = "git restore";
      gus = "git restore --staged";

      lines = "nix-shell -p tokei --run 'tokei --sort lines'";
      shell = "nix-shell --command fish shell.nix";
      try = "nix-shell --command fish -p";
    };
  };

  system.activationScripts.fishSetup = {
    deps = [];
    text = let
      fishConf = import ./fish-conf.nix {inherit pkgs theme;};

      fishTheme = pkgs.fetchurl {
        hash = "sha256-sAn4eJy6tmloWbN0p+mBdku3CK5TUeKVtVsaH/CBnGk=";
        url = "${theme.rawGithub}/fish/main/themes/static/${theme.kebabName}.theme";
      };

      confLocation = "${users.jaq.home}/.config/fish";
      themeLocation = "${confLocation}/themes";
    in ''
      mkdir -p ${confLocation} ${themeLocation}

      ln -sf ${fishConf} ${confLocation}/config.fish
      ln -sf ${fishTheme} ${themeLocation}/${theme.kebabName}.theme
    '';
  };
}
