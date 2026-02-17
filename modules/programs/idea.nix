{
  pkgs,
  unfree-unstable,
  ...
}: {
  environment.systemPackages = [unfree-unstable.jetbrains.idea];
  programs.java = {
    enable = true;
    package = pkgs.jdk17;
  };
}
