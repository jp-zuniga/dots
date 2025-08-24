{...}: {
  imports = [
    ./audio
    ./boot
    ./disks
    ./fonts
    ./net
    ./nix
    ./printing
    ./security
    ./services
    ./users
    ./wayland
  ];

  time.timeZone = "America/Managua";
  system.stateVersion = "25.05";
}
