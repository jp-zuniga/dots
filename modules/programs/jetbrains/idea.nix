{
  pkgs,
  unfree-unstable,
  ...
}: {
  environment.systemPackages = [
    unfreeunstable.jetbrains.idea-ultimate
    pkgs.postgresql_jdbc
  ];

  programs.java = {
    enable = true;
    package = pkgs.jdk17;
  };
}
