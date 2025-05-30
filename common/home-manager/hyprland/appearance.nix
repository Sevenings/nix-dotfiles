{ config, pkgs, ... }:

{
  # Configurações comuns do Hyprland
  wayland.windowManager.hyprland.settings = {

    general = {
      gaps_in = 8;
      gaps_out = 12;
      border_size = 3;

      "col.active_border" = "rgb(f92672)";
      "col.inactive_border" = "rgba(595959aa)";

      layout = "dwindle";

      allow_tearing = false;
      resize_on_border = true ;
    };

    decoration = {
      rounding = 2;

      blur = {
        enabled = true;
        size = 7;
        passes = 3;
        vibrancy = 0.1696;
      };

      shadow = {
        enabled = true;
        range = 4;
        render_power = 3;
        color = "rgba(1a1a1aee)";
      };

      layerrule = [
        "blur,waybar"
      ];
    };

    animations = {
      enabled = true;
    };

    bezier = [
      "myBezier, 0.05, 0.9, 0.1, 1.05"
      "Abezier, 0.99, 0.39, 0.04, 0.59"
      "linear, 0, 0, 1, 1"
      "easeOutBack, .25,-0.01,.28,1.16"
      "rush, 0,.97,.26,.98"
    ];

    animation = [
      "windows, 1, 3, myBezier"
      "windowsOut, 1, 3, default, popin 80%"
      "border, 1, 10, default"
      "borderangle, 1, 8, default"
      "fade, 1, 3, default"

      "specialWorkspace, 1, 3, easeOutBack, slidevert"
    ];

    plugin = {
      hyprbars = {
        bar_height = 18;
        bar_color = "rgb(1F1F28)";
        "col.text" = "rgb(f7f3d2)";
        bar_text_size = 12;
        bar_text_font = "Cantarell Bold";
        bar_title_enabled = true;
        bar_text_align = "center";
        bar_buttons_alignment = "right";
        bar_part_of_window = true;
        bar_precedence_over_border = false;
        bar_padding = 7;
        bar_button_padding = 5;

        hyprbars-button = [
          # color, size, icon, on-click
          "rgb(ff1f1f), 14, , hyprctl dispatch killactive"
          "rgb(f2e41b), 14, , hyprctl dispatch togglefloating #"
          "rgb(58fc2b), 14, , hyprctl dispatch fullscreen 1"
        ];
      };
    };

    windowrulev2 = [
      "bordercolor rgb(00ff33),class:(floatingTerminal),title:(python3)"
      "bordercolor rgb(FFB900),class:(floatingTerminal),title:(calcurse)"
    ];
  };
}
