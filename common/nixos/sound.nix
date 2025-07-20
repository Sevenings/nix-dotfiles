{ ... }:
{

  sound.enable = true;  
  hardware.pulseaudio.enable = true;

  services.mpd = {
    enable = true;
    user = "okabe";
    musicDirectory = "/home/okabe/Musicas";
    extraConfig = ''
      audio_output {
        type "pulse"
        name "PulseAudio"
      }
    '';
    network.listenAddress = "any";       # Permite conexões externas (opcional)
    startWhenNeeded = true;              # Inicia o serviço sob demanda :contentReference[oaicite:3]{index=3}
  };
}
