{ ... }:

{
  environment.sessionVariables = {
    GTK_USE_PORTAL = "1";          # força o uso de XDG portals
    TERMCMD        = "kitty";      # ou "wezterm start --always-new-process", "foot", etc.
  };
}
