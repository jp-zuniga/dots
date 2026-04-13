{
  flake.nixosModules = {
    audio = ./audio.nix;
    bluetooth = ./bluetooth.nix;
    boot = ./boot.nix;
    fonts = ./fonts.nix;
    laptop = ./laptop.nix;
    net = ./net.nix;
    nix = ./nix.nix;
    postgres = ./postgres.nix;
    services = ./services.nix;
    users = ./users.nix;
    virtualisation = ./virtualisation.nix;
    wayland = ./wayland.nix;
  };
}
