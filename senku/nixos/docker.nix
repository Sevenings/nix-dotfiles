{ pkgs, ... }:

{
  virtualisation.docker.enable = true;

  environment.systemPackages = with pkgs; [
    docker-compose
  ];
  
  users.users.senku = {
    extraGroups = [ "docker" ];
  };
}
