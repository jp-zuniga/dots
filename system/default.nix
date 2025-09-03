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
    ./virtualisation
    ./wayland
  ];

  time.timeZone = "America/Managua";
}
