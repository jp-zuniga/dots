{
  config,
  pkgs,
  ...
}: {
  services.postgresql = {
    enable = true;
    ensureDatabases = ["bancadesk"];
    ensureUsers = [{name = "jaq";}];

    # username must match pg user for peer authentication
    authentication = ''
      local   all     all                   peer
      host    all     all     127.0.0.1/32  scram-sha-256
      host    all     all     ::1/128       scram-sha-256
    '';

    initialScript = pkgs.writeText "init-bancadesk.sql" ''
      ALTER DATABASE bancadesk OWNER TO jaq;
      GRANT ALL PRIVILEGES ON DATABASE bancadesk TO jaq;
    '';
  };
}
