{ pkgs, ... }:
{
  programs.taskwarrior = {
    enable = true;
    package = pkgs.taskwarrior3;
    config = {
      sync.server.url="https://tasks.sevening.com.br";
      sync.server.client_id="852c396d-987f-43fa-bd72-f2d85a3572ed";
      sync.encryption_secret="lucassupersecret";
      context.servico_ti.read="+servico_ti";
      context.servico_ti.write="+servico_ti";
      context.pessoal.read="+pessoal";
      context.pessoal.write="+pessoal";
      context.faculdade.read="+faculdade";
      context.faculdade.write="+faculdade";
    };
  };
}
