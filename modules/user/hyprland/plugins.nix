{ inputs, pkgs, ... }:

{

  # Installed Plugins
  wayland.windowManager.hyprland.plugins = [
    inputs.hypr-dynamic-cursors.packages.${pkgs.system}.hypr-dynamic-cursors
  ];

  # Plugins Settings
  wayland.windowManager.hyprland.settings.plugin = {

    # Dynamic Cursors
    dynamic-cursors = {
      shake.enabled = false;
      mode = "stretch";
      stretch = {
        function = "quadratic";
        limit = 4300;
      };
    };

};

}
