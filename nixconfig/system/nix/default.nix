{pkgs}: {
  nix = {
    # give rebuilds low priority so system stays responsive
    daemonCPUSchedPolicy = "idle";
    daemonIOSchedClass = "idle";

    # use nh instead
    gc.automatic = false;

    # nix but cooler
    package = pkgs.lix;

    settings = {
      accept-flake-config = true;
      auto-optimise-store = true;
      extra-experimental-features = ["flakes" "nix-command"];

      # allow sudo users to mark the following values as trusted
      allowed-users = ["@wheel"];
      trusted-users = ["@wheel"];

      commit-lockfile-summary = "chore: Update flake.lock";
      keep-derivations = true;
      keep-outputs = true;
      warn-dirty = false;

      sandbox = true;
      max-jobs = "auto";
      keep-going = true; # continue building derivations if one fails
      log-lines = 20;

      # use binary cache, it's not gentoo
      builders-use-substitutes = true;
      substituters = [
        "https://cache.nixos.org"
      ];
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowBroken = false;
    };
  };

  programs.nix-ld.enable = true;
  programs.nh = {
    enable = true;
    flake = "/home/jaq/dots";
  };

  systemd.services.nix-daemon = {
    environment.TMPDIR = "/var/tmp";
  };
}
