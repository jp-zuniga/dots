{
  pkgs,
  theme,
  ...
}: {
  programs.steam = {
    enable = true;
    extraPackages = [
      (pkgs.callPackage ../scripts/system-cursor {inherit pkgs theme;})
    ];
  };
}
