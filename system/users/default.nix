{
  flake,
  pkgs,
  config,
}: {
  users.users = {
    jaq = {
      extraGroups = [
        "networkmanager"
        "wheel"
      ];

      isNormalUser = true;
      homix = true;
      shell = flake.packages.${pkgs.system}.fish;
    };
  };

  security = {
    sudo = {
      enable = true;
      extraRules = [
        {
          commands =
            builtins.map (command: {
              command = "/run/current-system/sw/bin/${command}";
              options = ["NOPASSWD"];
            })
            ["nixos-rebuild" "poweroff" "reboot" "systemctl"];

          groups = ["wheel"];
        }
      ];
    };
  };
}
