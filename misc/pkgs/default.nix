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
  switchlayout = pkgs.callPackage ./switchlayout {};
  togglecaps = pkgs.callPackage ./togglecaps {};
  workspace = pkgs.callPackage ./workspace {};
}
