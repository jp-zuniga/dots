{config, ...}: {
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = builtins.attrNames config.users.users;
  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };
}
