{
  config,
  pkgs,
  ...
}: {
  boot.kernelModules = ["vfio-pci"];
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = builtins.attrNames config.users.users;
  users.groups.kvm.members = builtins.attrNames config.users.users;
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        ovmf.enable = true;
        swtpm.enable = true;
      };
    };

    spiceUSBRedirection.enable = true;
  };

  services.spice-vdagentd.enable = true;
}
