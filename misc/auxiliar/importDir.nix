{ lib, ... }:

dir: 
  let
    # Caminho base para os seus módulos
    modulesPath = dir;
    
    # Lê o conteúdo do diretório
    content = builtins.readDir modulesPath;
    
    # Filtra apenas o que nos interessa (diretórios ou arquivos .nix) e remove arquivos indesejados como 'default.nix' se necessário
    validModules = lib.filterAttrs (name: type:
      (type == "directory" || lib.hasSuffix ".nix" name) && (name != "default.nix") && (name != "TEMPLATE")
    ) content;
  in
  # Transforma os nomes dos arquivos em caminhos completos
  (map (name: modulesPath + "/${name}") (builtins.attrNames validModules))

