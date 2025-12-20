{pkgs, ...}: let
  userDirsConf = pkgs.writeText "user-dirs.dirs" ''
    XDG_DESKTOP_DIR="$HOME/dsktp"
    XDG_DOWNLOAD_DIR="$HOME/dwnlds"
    XDG_TEMPLATES_DIR="$HOME/tmplts"
    XDG_PUBLICSHARE_DIR="$HOME/public"
    XDG_DOCUMENTS_DIR="$HOME/docs"
    XDG_MUSIC_DIR="$HOME/moosic"
    XDG_PICTURES_DIR="$HOME/pics"
    XDG_VIDEOS_DIR="$HOME/vids"
  '';
in {
  environment.systemPackages = [pkgs.xdg-user-dirs];

  systemd.user.tmpfiles.rules = [
    "L+ %h/.config/user-dirs.dirs - - - - ${userDirsConf}"
  ];

  environment.sessionVariables = {
    XDG_DESKTOP_DIR = "$HOME/dsktp";
    XDG_DOWNLOAD_DIR = "$HOME/dwnlds";
    XDG_TEMPLATES_DIR = "$HOME/tmplts";
    XDG_PUBLICSHARE_DIR = "$HOME/public";
    XDG_DOCUMENTS_DIR = "$HOME/docs";
    XDG_MUSIC_DIR = "$HOME/moosic";
    XDG_PICTURES_DIR = "$HOME/pics";
    XDG_VIDEOS_DIR = "$HOME/vids";
  };
}
