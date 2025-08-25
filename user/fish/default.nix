{
  pkgs,
  theme,
  ...
}: let
  fishTheme = import ./fish-theme.nix {inherit pkgs theme;};
  fishInit = import ./fish-init.nix {inherit pkgs fishTheme;};
in {
  programs.fish = {
    enable = true;
    shellInit = fishInit;
    shellAbbrs = {
      # nix aliases
      rebuild = "~/dots/scripts/rebuild.sh";
      ale = "alejandra -q .";

      # git aliases
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
      gp = "git push";
      gpf = "git push --force-with-lease";
      gpl = "git pull";
      gs = "git status --short";
      gst = "git stash";
      gsw = "git switch";

      # eza/ls aliases
      e = "custom-eza";
      ea = "custom-eza -a";
      el = "custom-eza -al";
      et = "custom-eza -at";
      er = "custom-eza -atr";
    };
  };
}
