{
  pkgs,
  theme,
  ...
}: {
  programs.steam = {
    enable = true;
    extraPackages = let
      inherit (import ../scripts {inherit pkgs theme;}) system-cursor;
    in [system-cursor];
  };
}
