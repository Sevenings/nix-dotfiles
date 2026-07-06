{ pkgs, ... }:
{
  programs.taskwarrior = {
    enable = true;
    package = pkgs.taskwarrior3;
    config = {
      sync.server.url="http://tasks.bebop.lan";
      sync.server.client_id="852c396d-987f-43fa-bd72-f2d85a3572ed";
      sync.encryption_secret="lucassupersecret";
    };
  };
}
