{
  pkgs,
  unfree-unstable,
  ...
}: {
  environment.systemPackages = [
    unfree-unstable.android-studio
    unfree-unstable.jetbrains.idea
  ];

  programs.java = {
    enable = true;
    package = pkgs.jdk17;
  };
}
