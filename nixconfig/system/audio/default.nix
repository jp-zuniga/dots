{pkgs, ...}: {
  pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };

    jack.enable = true;
    pulse.enable = true;
  };

  hardware = {
    pulseaudio.support32Bit = true;
  };
}
