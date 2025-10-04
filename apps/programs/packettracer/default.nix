{
  lib,
  pkgs,
  theme,
  ...
}: {
  environment.systemPackages = [
    (pkgs.ciscoPacketTracer8.override {
      packetTracerSource = /home/jaq/docs/CiscoPacketTracer822_amd64_signed.deb;
    })
  ];

  programs.firejail = {
    enable = true;
    wrappedBinaries = {
      packettracer8 = {
        executable = lib.getExe pkgs.ciscoPacketTracer8;
        extraArgs = [
          "--net=none"
          "--noprofile"
          "--env=QT_QPA_PLATFORMTHEME="
          "--env=QT_STYLE_OVERRIDE=Fusion"
        ];
      };

      desktop = "${pkgs.ciscoPacketTracer8}/share/applications/cisco-pt8.desktop.desktop";
    };
  };
}
