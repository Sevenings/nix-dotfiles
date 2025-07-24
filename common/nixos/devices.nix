{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    simple-mtpfs
    jmtpfs
    gvfs
  ];
}
