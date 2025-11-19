{
  config,
  lib,
  pkgs,
  ...
}: {
  nix = {
    daemonCPUSchedPolicy = "idle";
    daemonIOSchedClass = "idle";
    gc.automatic = false;
    package = pkgs.lix;
    settings = {
      allowed-users = ["@wheel"];
      accept-flake-config = true;
      auto-optimise-store = true;
      builders-use-substitutes = true;
      commit-lockfile-summary = "chore: update flake.lock";
      extra-experimental-features = ["flakes" "nix-command"];
      keep-derivations = true;
      keep-going = true;
      keep-outputs = true;
      log-lines = 20;
      max-jobs = "auto";
      sandbox = true;
      substituters = ["https://cache.nixos.org"];
      trusted-users = ["@wheel"];
      warn-dirty = false;
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowBroken = false;
    };

    hostPlatform = lib.mkDefault "x86_64-linux";
  };

  programs = {
    nh = {
      enable = true;
      flake = "${config.users.users.jaq.home}/dev/dots";
    };

    nix-ld.enable = true;
  };

  systemd.services.nix-daemon.environment.TMPDIR = "/var/tmp";
}
