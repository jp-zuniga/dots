{...}: {
  imports = [
    ./audio
    ./boot
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
}
