{
  pkgs,
  theme,
  ...
}: {
  programs.steam = {
    enable = true;
    extraPackages = let
      inherit (import ../../pkgs/scripts {inherit pkgs theme;}) system-cursor;
    in [system-cursor];
  };
}
