{...}: {
  imports = [
    ./audio
    ./boot
    ./fonts
    ./net
    ./nix
    ./security
    ./services
    ./users
    ./virtualisation
    ./wayland
  ];

  time.timeZone = "America/Managua";
}
