{
  conf,
  pkgs,
  users,
  ...
}:
pkgs.symlinkJoin {
  name = "hypridle-wrapped";
  paths = [pkgs.hypridle];
  buildInputs = [pkgs.makeWrapper];
  postBuild = let
    confLocation = users.jaq.home + "/.config/hypr";
  in ''
    mkdir -p ${confLocation}

    ln -sf ${conf} ${confLocation}/hypridle.conf

    wrapProgram $out/bin/hypridle --add-flags "--config ${conf}"
  '';
}
