# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example'
pkgs: {
  babel = pkgs.callPackage ./babel {};
  colorpicker = pkgs.callPackage ./colorpicker {};
  focusmode = pkgs.callPackage ./focusmode {};
  horario_ponto = pkgs.callPackage ./horario_ponto {};
  musicnow = pkgs.callPackage ./musicnow {};
  openCalendar = pkgs.callPackage ./openCalendar {};
  python_calculator = pkgs.callPackage ./python_calculator {};
  reload_wallpaper = pkgs.callPackage ./reload_wallpaper {};
  reload_waybar = pkgs.callPackage ./reload_waybar {};
  se_expediente = pkgs.callPackage ./se_expediente {};
  switchlayout = pkgs.callPackage ./switchlayout {};
  togglecapslock = pkgs.callPackage ./togglecapslock {};
  workspace = pkgs.callPackage ./workspace {};
}
