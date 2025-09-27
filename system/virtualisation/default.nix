{
  config,
  pkgs,
  ...
}: {
  boot.kernelModules = ["vfio-pci"];
  environment.systemPackages = [pkgs.virtio-win];
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = builtins.attrNames config.users.users;
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        ovmf = {
          enable = true;
          packages = [pkgs.OVMFFull.fd];
        };

        swtpm.enable = true;
      };
    };

    spiceUSBRedirection.enable = true;
  };

  services.spice-vdagentd.enable = true;
}
