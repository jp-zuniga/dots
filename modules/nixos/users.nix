{
  pkgs,
  users,
  ...
}: {
  users.users =
    builtins.mapAttrs (name: user: {
      inherit (user) extraGroups home;
      homix = true;
      isNormalUser = true;
      shell = pkgs.fish;
    })
    users;

  security.sudo = {
    enable = true;
    extraRules = [
      {
        commands = builtins.map (
          command: {
            command = "/run/current-system/sw/bin/${command}";
            options = ["NOPASSWD"];
          }
        ) ["nixos-rebuild" "reboot"];

        groups = ["wheel"];
      }
    ];
  };
}
