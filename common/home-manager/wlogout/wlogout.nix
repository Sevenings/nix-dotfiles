{ ... }:

{
  programs.wlogout = {
    enable = true;
    style = ./styleGoku.css;

    layout = [
      {
          label = "shutdown";
          action = "systemctl poweroff";
          text = "Shutdown (S) ";
          keybind = "s";
      }
      {
          label = "reboot";
          action = "systemctl reboot";
          text = "Reboot (R) ";
          keybind = "r";
      }
      {
          label = "suspend";
          action = "systemctl suspend; sleep 2 && swaylock";
          text = "Suspend (U) ";
          keybind = "u";
      }
      {
          label = "logout";
          action = "hyprctl dispatch exit";
          text = "Logout (E) ";
          keybind = "e";
      }
    ];
  };
}
