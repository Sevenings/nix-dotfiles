{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    simple-mtpfs
    jmtpfs
    mtp-tools
    gvfs
    gvfs-mtp
  ];
}
