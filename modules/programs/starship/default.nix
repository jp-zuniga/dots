{
  flake,
  pkgs,
  theme,
  users,
  ...
}: let
  starshipConf = import ./star-conf.nix {inherit flake pkgs theme;};
  starshipLocation = "${users.jaq.home}/.config";
in {
  environment.systemPackages = [pkgs.starship];

  system.activationScripts.fishSetup = {
    deps = [];
    text = ''
      mkdir -p ${starshipLocation}

      ln -sf ${starshipConf} ${starshipLocation}/starship.toml
    '';
  };
}
