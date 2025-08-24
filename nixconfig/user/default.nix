rec
{
  theme = import ./theme;

  packages = pkgs: let
    inherit (pkgs) callPackage;
    theme = import ./theme pkgs;
  in {
    anyrun = callPackage ./wrapped/anyrun {inherit theme;};
    bat = callPackage ./wrapped/bat {inherit theme;};
    hypr = callPackage ./wrapped/hypr {inherit theme;};
    mako = callPackage ./wrapped/mako {inherit theme;};
    # nvim = callPackage ./wrapped/nvim {inherit theme;};
    waybar = callPackage ./wrapped/waybar {inherit theme;};
    zsh = callPackage ./wrapped/zsh {};
  };

  module = {pkgs, ...}: {
    config = {
      environment.systemPackages = builtins.attrValues (packages pkgs);
      programs.hyprland = {
        enable = true;
        withUWSM = true;
      };
    };

    imports = [
      ./packages.nix
      ./git
      ./gtk
    ];
  };
}
