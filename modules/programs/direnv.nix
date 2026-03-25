{
  flake,
  pkgs,
  users,
  ...
}: {
  environment.systemPackages = [
    pkgs.direnv
    pkgs.nix-direnv
  ];

  system.activationScripts.direnvSetup = {
    deps = [];
    text = let
      confLocation = "${users.jaq.home}/.config/direnv";
      direnv = "direnv.toml";

      direnvConf = {
        global = {
          disable_stdin = true;
          hide_env_diff = true;
          load_dotenv = true;
          strict_env = true;
          warn_timeout = 0;
        };
      };

      direnvToml = pkgs.writeText direnv (flake.lib.toTOML direnvConf);
    in ''
      mkdir -p ${confLocation}
      ln -sf ${direnvToml} ${confLocation}/${direnv}
    '';
  };
}
