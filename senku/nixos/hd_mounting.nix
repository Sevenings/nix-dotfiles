# Faz o mount do HD no meu SSD, e bind mount de algumas pastas relevantes

{ ... }:

{
  # Instala o driver ntfs-3g, necessário para fazer o bind com esse HD que usa a formatação ntfs
  boot.supportedFilesystems = [ "ntfs" ];

  environment.systemPackages = with pkgs; [
    ntfs3g
  ];

  # Monta a partição em /media/hd
  fileSystems."/media/hd" = {
    device = "/dev/disk/by-uuid/5E4676054675DDE9";
    fsType = "nfts-3g"; # Altere se for outro tipo (ex: btrfs, xfs etc.)
    options = [
      "uid=1000"            # UID do seu usuário
      "gid=100"             # GID do seu grupo principal
      "dmask=027"           # Permissões p/ diretórios
      "fmask=137"           # Permissões p/ arquivos
      "windows_names"       # Impede caracteres inválidos no Windows
      "defaults"
    ];
  };


  # Agora, “bind mounts” das pastas no HD para a /home
  fileSystems."/home/senku/Documentos" = {
    device = "/media/hd/Documentos";
    fsType = "none";
    options = [ "bind" ];
  };

  fileSystems."/home/senku/Downloads" = {
    device = "/media/hd/Downloads";
    fsType = "none";
    options = [ "bind" ];
  };

  fileSystems."/home/senku/Imagens" = {
    device = "/media/hd/Imagens";
    fsType = "none";
    options = [ "bind" ];
  };

  fileSystems."/home/senku/Musicas" = {
    device = "/media/hd/Musicas";
    fsType = "none";
    options = [ "bind" ];
  };

  fileSystems."/home/senku/Videos" = {
    device = "/media/hd/Videos";
    fsType = "none";
    options = [ "bind" ];
  };

}
