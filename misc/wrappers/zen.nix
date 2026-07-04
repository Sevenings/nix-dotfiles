{ pkgs, inputs, system }:

# Wrapper para o Zen Browser que sempre usa o perfil "default"
pkgs.writeShellScriptBin "zen" ''
  exec ${inputs.zen-browser.packages."${system}".default}/bin/zen-beta -P "default" "$@"
''
