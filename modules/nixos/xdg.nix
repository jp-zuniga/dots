{pkgs, ...}: let
  desktop = "dsktp";
  documents = "docs";
  download = "dwnlds";
  music = "moosic";
  pictures = "pics";
  publicshare = "pubshare";
  templates = "tmplts";
  videos = "vids";

  userDirsConf = pkgs.writeText "user-dirs.dirs" ''
    XDG_DESKTOP_DIR="$HOME/${desktop}"
    XDG_DOCUMENTS_DIR="$HOME/${documents}"
    XDG_DOWNLOAD_DIR="$HOME/${download}"
    XDG_MUSIC_DIR="$HOME/${music}"
    XDG_PICTURES_DIR="$HOME/${pictures}"
    XDG_PUBLICSHARE_DIR="$HOME/${publicshare}"
    XDG_TEMPLATES_DIR="$HOME/${templates}"
    XDG_VIDEOS_DIR="$HOME/${videos}"
  '';
in {
  environment.systemPackages = [pkgs.xdg-user-dirs];

  systemd.user.tmpfiles.rules = [
    "L+ %h/.config/user-dirs.dirs - - - - ${userDirsConf}"
  ];

  environment = {
    etc."xdg/user-dirs.defaults".text = ''
      DESKTOP=${desktop}
      DOCUMENTS=${documents}
      DOWNLOAD=${download}
      MUSIC=${music}
      PICTURES=${pictures}
      PUBLICSHARE=${publicshare}
      TEMPLATES=${templates}
      VIDEOS=${videos}
    '';

    sessionVariables = {
      XDG_DESKTOP_DIR = "$HOME/${desktop}";
      XDG_DOCUMENTS_DIR = "$HOME/${documents}";
      XDG_DOWNLOAD_DIR = "$HOME/${download}";
      XDG_MUSIC_DIR = "$HOME/${music}";
      XDG_PICTURES_DIR = "$HOME/${pictures}";
      XDG_PUBLICSHARE_DIR = "$HOME/${publicshare}";
      XDG_TEMPLATES_DIR = "$HOME/${templates}";
      XDG_VIDEOS_DIR = "$HOME/${videos}";
    };
  };
}
