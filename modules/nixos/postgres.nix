{
  inputs,
  pkgs,
  ...
}: let
  unstable = import inputs.nixpkgs-unstable {system = pkgs.stdenv.hostPlatform.system;};
in {
  services.postgresql = {
    enable = true;
    package = unstable.postgresql_18;
    authentication = ''
      local   all     all                                     peer
      host    all     all     127.0.0.1/32                    scram-sha-256
      host    all     all     ::1/128                         scram-sha-256
    '';
  };
}
