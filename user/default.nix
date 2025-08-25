{}: {
  theme = import ./theme;

  packages = pkgs: let
    inherit (pkgs) callPackage;
    theme = import ./theme pkgs;
  in {
    alacritty = callPackage ./wrapped/alacritty {inherit theme;};
    anyrun = callPackage ./wrapped/anyrun {inherit theme;};
    bat = callPackage ./wrapped/bat {inherit theme;};
    hypr = callPackage ./wrapped/hypr {inherit theme;};
    mako = callPackage ./wrapped/mako {inherit theme;};
    waybar = callPackage ./wrapped/waybar {inherit theme;};
  };

  module = {pkgs}: let
    theme = import ./theme pkgs;
  in {
    config = {
      environment.systemPackages = builtins.attrValues (packages pkgs);
      programs.hyprland = {
        enable = true;
      };
    };

    imports = [
      ./packages.nix
      (import ./eza {inherit pkgs theme;})
      (import ./fish {inherit theme;})
      ./git
      (import ./gtk {inherit pkgs theme;})
      (import ./qbittorrent {inherit pkgs theme;})
      (import ./starship {inherit theme;})
    ];
  };
}
