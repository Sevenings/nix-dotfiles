{ ... }:

{
  programs.yazi.flavors = {
      everforest-medium = ./flavors/everforest-medium.yazi;
      monokai-vibrant = ./flavors/monokai-vibrant.yazi;
      ayu-dark = ./flavors/ayu-dark.yazi;
    };

  programs.yazi.theme = {

    flavor = {
      dark = "monokai-vibrant";
    };


    icon = {
      prepend_dirs = [
        { name = "Anotações"; text = ""; }
        { name = "Documentos"; text = ""; }
        { name = "Imagens"; text = ""; }
        { name = "Musicas"; text = ""; }
        { name = "Playground"; text = "󱊈"; }
        { name = "Projetos"; text = ""; }
      ];
    };

  };
}
