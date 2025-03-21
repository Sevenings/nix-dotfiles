{ ... }:

{
  services.docker = "true";
  
  users.users.senku = {
    extraGroups = [ "docker" ];
  };
}
