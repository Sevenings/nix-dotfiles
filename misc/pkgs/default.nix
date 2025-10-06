# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example'
pkgs:
let
  # Get all directories in current directory that contain a default.nix file
  packageDirs = builtins.filter (dir: 
    builtins.pathExists (./. + "/${dir}/default.nix")
  ) (builtins.attrNames (builtins.readDir ./.));
  
  # Create an attribute set from the package directories
  packages = builtins.listToAttrs (map (dir: {
    name = dir;
    value = pkgs.callPackage (./. + "/${dir}") {};
  }) packageDirs);
in
packages
