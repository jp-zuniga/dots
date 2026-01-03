{pkgs, ...}: {
  environment.systemPackages = [
    (pkgs.prismlauncher.override {
      additionalPrograms = [pkgs.libxrender pkgs.jdk25];
    })
  ];
}
