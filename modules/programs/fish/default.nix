{
  flake,
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
      gca = "git commit -a";
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
      gu = "git restore --staged";

      lines = "nix-shell -p tokei --run tokei";
      ndev = "nix develop --command fish --profile";
      shell = "nix-shell --command fish shell.nix";
      try = "nix-shell --command fish -p";
    };
  };

  system.activationScripts.fishSetup = {
    deps = [];
    text = let
      fishConf = import ./fish-conf.nix {inherit pkgs theme;};

      fishTheme = let
        themeVariant = flake.lib.capitalize theme.rosePineVariant;
      in
        pkgs.fetchurl {
          hash = "sha256-WUCByT9bdqKGkWxoxUG184ZY51oczCfe06Fkj/iz7HE=";
          url = "https://raw.githubusercontent.com/rose-pine/fish/main/themes/Rosé%20Pine%20${themeVariant}.theme";
        };

      fishLocation = "${users.jaq.home}/.config/fish";
      themeLocation = "${fishLocation}/themes";
    in ''
      mkdir -p ${fishLocation} ${themeLocation}

      ln -sf ${fishConf} ${fishLocation}/config.fish
      ln -sf ${fishTheme} ${themeLocation}/rose-pine-${theme.rosePineVariant}.theme
    '';
  };
}
