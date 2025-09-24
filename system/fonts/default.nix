{pkgs, ...}: {
  fonts = {
    fontconfig = {
      defaultFonts = {
        monospace = ["JetBrainsMono Nerd Font"];
        sansSerif = ["Noto SansSerif"];
        serif = ["Noto Serif"];
      };
    };

    packages = [
      pkgs.nerd-fonts.jetbrains-mono
      pkgs.noto-fonts
    ];
  };
}
