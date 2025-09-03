{pkgs, ...}: {
  users.users = {
    jaq = {
      extraGroups = [
        "libvirtd"
        "networkmanager"
        "wheel"
      ];

      isNormalUser = true;
      homix = true;
      shell = pkgs.fish;
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
