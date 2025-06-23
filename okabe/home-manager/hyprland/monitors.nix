{ ... }:

{
    wayland.windowManager.hyprland.settings = {

      # Monitor configuration
      monitor = [
        # Monitor principal
        "eDP-1, highres, 0x0, 1"	

        # Monitor do estágio
        "desc:Dell Inc. DELL D2216H 70GJH69U1SII, highres, 0x-1080, 1"	

        # Outros monitores: espelhados por padrão
        ", highres, 0x1080, 1, mirror, eDP-1"  
        # Outros monitores: Extender à esquerda
        # ", highres, -1920x0, 1"  
      ];

    };
}
