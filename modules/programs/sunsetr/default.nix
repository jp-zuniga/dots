{
  pkgs,
  users,
  ...
}: {
  environment.systemPackages = [pkgs.sunsetr];
  system.activationScripts.sunsetrSetup = {
    deps = [];
    text = let
      confLocation = users.jaq.home + "/.config/sunsetr";
      sunsetrConf = import ./sunsetr-conf.nix {inherit pkgs;};
    in ''
      mkdir -p ${confLocation}

      ln -sf ${sunsetrConf} ${confLocation}/sunsetr.toml
    '';
  };
}
