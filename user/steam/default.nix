{
  pkgs,
  theme,
  ...
}: let
  # gracias steam por:
  steam-cursor = pkgs.runCommandLocal "steam-cursor" {} ''
    mkdir -p $out/share/icons
    ln -s ${theme.cursor.x.package}/share/icons/BreezeX-RosePine-Linux $out/share/icons/default
  '';
in {
  programs.steam = {
    enable = true;
    extraPackages = [steam-cursor];
  };
}
