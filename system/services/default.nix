{...}: {
  services = {
    postgresql = {
      enable = true;
      ensureDatabases = ["nutriplan"];
      authentication = ''
        #type database  DBuser  auth-method
        local all       all     trust
      '';
    };

    printing.enable = false;
  };
}
