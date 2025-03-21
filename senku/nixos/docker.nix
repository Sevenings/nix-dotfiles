{ ... }:

{
  virtualisation.docker.enable = true;
  
  users.users.senku = {
    extraGroups = [ "docker" ];
  };
}
