{
  alsa-lib,
  brotli,
  buildFHSEnv,
  copyDesktopItems,
  expat,
  dbus,
  dpkg,
  freetype,
  fontconfig,
  glib,
  harfbuzz,
  lib,
  libdrm,
  libglvnd,
  libpng,
  libpulseaudio,
  libudev0-shim,
  libxkbcommon,
  libxkbfile,
  libxml2,
  libxslt,
  makeDesktopItem,
  makeWrapper,
  nspr,
  nss,
  packetTracerSource,
  requireFile,
  stdenvNoCC,
  wayland,
  xorg,
  ...
}: let
  pname = "ciscoPacketTracer9";
  version = "9.0.0";

  src = packetTracerSource;

  unwrapped = stdenvNoCC.mkDerivation {
    name = "${pname}-unwrapped";

    inherit src version;

    nativeBuildInputs = [
      dpkg
      makeWrapper
    ];

    dontAutoPatchelf = true;

    unpackPhase = ''
      runHook preUnpack
      dpkg-deb -x "$src" "$out"
      chmod 755 "$out"
      runHook postUnpack
    '';

    installPhase = ''
      runHook preInstall

      appimage="$out/opt/pt/packettracer.AppImage"
      chmod +x "$appimage"

      makeWrapper "$appimage" "$out/bin/packettracer" \
        --set APPIMAGE_EXTRACT_AND_RUN 1 \
        --set QT_QPA_PLATFORM xcb

      runHook postInstall
    '';
  };

  buildInputs =
    [
      alsa-lib
      brotli
      dbus
      expat
      freetype
      fontconfig
      glib
      harfbuzz
      libdrm
      libglvnd
      libpng
      libpulseaudio
      libudev0-shim
      libxkbcommon
      libxkbfile
      libxml2
      libxslt
      makeWrapper
      nspr
      nss
      wayland
    ]
    ++ (with xorg; [
      libICE
      libSM
      libX11
      libxcb
      libXcomposite
      libXcursor
      libXdamage
      libXext
      libXfixes
      libXi
      libXrandr
      libXrender
      libXScrnSaver
      libXtst
      xcbutilimage
      xcbutilkeysyms
      xcbutilrenderutil
      xcbutilwm
    ]);

  fhs = buildFHSEnv {
    name = "${pname}-fhs";
    runScript = lib.getExe' unwrapped "packettracer";
    targetPkgs = pkgs:
      buildInputs
      ++ [
        pkgs.desktop-file-utils
        pkgs.gtk3
        pkgs.xdg-utils
        pkgs.zlib
      ];
  };
in
  stdenvNoCC.mkDerivation {
    inherit pname version;

    dontUnpack = true;

    nativeBuildInputs = [copyDesktopItems];

    installPhase = ''
      runHook preInstall

      mkdir -p "$out/bin"
      mkdir -p "$out/share/applications"
      mkdir -p "$out/share/icons/hicolor/256x256/apps"

      cp -v ${fhs}/bin/${pname}-fhs "$out/bin/packettracer9"

      if [ -f ${unwrapped}/opt/pt/art/icon.png ]; then
        cp ${unwrapped}/opt/pt/art/icon.png \
          "$out/share/icons/hicolor/256x256/apps/packettracer.png"
      fi

      runHook postInstall
    '';

    desktopItems = [
      (makeDesktopItem {
        comment = "Cisco Packet Tracer 9.0.0";
        desktopName = "Cisco Packet Tracer 9";
        exec = "packettracer9 %f";
        icon = "packettracer";
        name = "cisco-pt9.desktop";
        mimeTypes = [
          "application/x-pkt"
          "application/x-pka"
          "application/x-pkz"
          "application/x-pksz"
          "application/x-pks"
        ];
      })
    ];

    meta = {
      description = "Network simulation tool from Cisco";
      homepage = "https://www.netacad.com/courses/packet-tracer";
      mainProgram = "packettracer9";
      license = lib.licenses.unfree;
      platforms = ["x86_64-linux"];
      sourceProvenance = with lib.sourceTypes; [binaryNativeCode];
    };
  }
