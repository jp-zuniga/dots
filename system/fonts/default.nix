{pkgs, ...}: {
  fonts = {
    packages =
      builtins.attrValues {
        inherit
          (pkgs)
          noto-fonts
          ;
      }
      ++ [
        pkgs.nerd-fonts.jetbrains-mono
      ];

    fontconfig = {
      defaultFonts = {
        monospace = ["JetBrainsMono Nerd Font"];
        sansSerif = ["Noto SansSerif"];
        serif = ["Noto Serif"];
      };
    };
  };
}
