{
  inputs,
  lib,
  pkgs,
  ...
}: let
  unstable = import inputs.nixpkgs-unstable {
    system = pkgs.stdenv.hostPlatform.system;
    config.allowUnfree = true;
  };

  extra-lib = with pkgs; [];
  extra-path = [
    pkgs.dotnet-sdk
    pkgs.nuget
    unstable.avalonia
  ];

  rider = pkgs.jetbrains.rider.overrideAttrs (attrs: {
    postInstall =
      ''
        mv $out/bin/rider $out/bin/.rider-toolless
        makeWrapper $out/bin/.rider-toolless $out/bin/rider \
          --argv0 rider \
          --prefix PATH : "${lib.makeBinPath extra-path}" \
          --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath extra-lib}"

        shopt -s extglob
        ln -s $out/rider/!(bin) $out/
        shopt -u extglob
      ''
      + attrs.postInstall or "";
  });

  riderDesktop = pkgs.makeDesktopItem {
    name = "jetbrains-rider";
    desktopName = "Rider";
    exec = "\"${rider}/bin/rider\"";
    icon = "rider";
    type = "Application";
    extraConfig.NoDisplay = "true";
  };
in {
  environment.systemPackages = [rider riderDesktop];
  systemd.user.tmpfiles.rules = [
    "d %h/.local/share/applications - - - - -"
    "L %h/.local/share/applications/jetbrains-rider.desktop - - - - ${riderDesktop}/share/applications/jetbrains-rider.desktop"
  ];
}
