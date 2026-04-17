{pkgs, ...}: {
  environment.systemPackages = [
    (pkgs.prismlauncher.override {
      additionalPrograms = [pkgs.libxrender];
      controllerSupport = false;
      gamemodeSupport = false;
      jdks = [pkgs.jdk25];
      textToSpeechSupport = false;
    })
  ];
}
