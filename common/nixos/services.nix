{ ... }:

{
  services = {

    clipcat.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      jack.enable = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };

    mpd = {
      enable = true;
      user = "okabe";
      musicDirectory = "/home/okabe/Musicas";
      network.listenAddress = "any";
      startWhenNeeded = false;

      extraConfig = ''
        audio_output {
          type        "pulse"
          name        "PipeWire Pulse"
          server      "127.0.0.1"
        }
      '';
    };
  };
}
