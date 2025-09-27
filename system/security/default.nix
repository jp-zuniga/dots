{pkgs, ...}: {
  boot = {
    blacklistedKernelModules = [
      # obscure network protocols
      "ax25"
      "netrom"
      "rose"

      # old/rare filesystems
      "adfs"
      "affs"
      "bfs"
      "befs"
      "cramfs"
      "efs"
      "erofs"
      "exofs"
      "freevxfs"
      "f2fs"
      "vivid"
      "gfs2"
      "ksmbd"
      "nfsv4"
      "nfsv3"
      "cifs"
      "nfs"
      "cramfs"
      "freevxfs"
      "jffs2"
      "hfs"
      "hfsplus"
      "squashfs"
      "udf"
      "hpfs"
      "jfs"
      "minix"
      "nilfs2"
      "omfs"
      "qnx4"
      "qnx6"
      "sysv"
    ];
  };

  fileSystems."/boot".options = ["nodev" "nosuid" "noexec"];
  security = {
    apparmor = {
      enable = true;
      killUnconfinedConfinables = true;
      packages = [pkgs.apparmor-profiles];
    };

    forcePageTableIsolation = true;
    lockKernelModules = false;
    polkit.enable = true;
    protectKernelImage = false;
    rtkit.enable = true;
  };
}
