{
  pkgs,
  theme,
  ...
}: let
  inherit (import ../cursor {inherit pkgs theme;}) cursor-theme;
in {
  programs.steam = {
    enable = true;
    extraPackages = [cursor-theme];
  };
}
