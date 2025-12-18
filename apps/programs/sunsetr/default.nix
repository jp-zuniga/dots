{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = [pkgs.sunsetr];
  system.activationScripts.sunsetrSetup = {
    deps = [];
    text = let
      confLocation = config.users.users.jaq.home + "/.config/sunsetr";
      sunsetrConf = import ./sunsetr-conf.nix pkgs;
    in ''
      mkdir -p ${confLocation}
      ln -sf ${sunsetrConf} ${confLocation}/sunsetr.toml
    '';
  };
}
