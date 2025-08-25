{pkgs, ...}: {
  fonts = {
    packages =
      builtins.attrValues {
        inherit
          (pkgs)
          material-icons
          material-design-icons
          noto-fonts
          noto-fonts-cjk-sans
          noto-fonts-emoji
          ;
      }
      ++ [
        pkgs.nerd-fonts.jetbrains-mono
        pkgs.nerd-fonts.meslo-lg
      ];

    fontconfig = {
      defaultFonts = {
        emoji = ["Noto Color Emoji"];
        monospace = ["JetBrainsMono Nerd Font"];
        sansSerif = ["Noto SansSerif" "Noto Color Emoji"];
        serif = ["Noto Serif" "Noto Color Emoji"];
      };
    };
  };
}
