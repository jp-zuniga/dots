{...}: {
  boot = {
    initrd = {
      availableKernelModules = ["nvme" "ehci_pci" "xhci_pci_renesas" "xhci_pci" "usbhid" "rtsx_pci_sdmmc"];
      kernelModules = [];
    };

    kernelModules = ["kvm-amd"];
    extraModulePackages = [];
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/7401bfde-fea4-4b8f-acae-48a64fa39d5e";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/D380-15BF";
      fsType = "vfat";
      options = ["fmask=0077" "dmask=0077"];
    };

    "/home" = {
      device = "/dev/disk/by-uuid/123974dd-acf4-4f34-aef1-9d8a9229e9a5";
      fsType = "ext4";
    };
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/06da4226-b6ad-4aca-b950-78ccda2f6ff9";}
  ];
}
