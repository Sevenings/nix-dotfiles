{ config, pkgs, home, ... }:

let
  # Lista de scripts
  scripts = [ 
	  "bluetoothManager.sh"
	  "colorPicker.sh" 
	  "fzfShot.sh" 
	  "launchHyprpaper.sh"
	  "launchWallpaper.sh"
	  "launchWaybar.sh"
	  "musicDownload.sh"
	  "openCalendar.sh"
	  "notd.sh"
	];  

  scriptConfigs = builtins.listToAttrs (map (script: {
    name = ".local/bin/${script}";
    value = {
      source = ./${script};
      executable = true;
    };
  }) scripts);
in
{
  home.file = scriptConfigs;


  # Adiciona ~/.local/bin ao PATH
  home.sessionVariables = {
    PATH = "$HOME/.local/bin:$PATH";
  };
}
