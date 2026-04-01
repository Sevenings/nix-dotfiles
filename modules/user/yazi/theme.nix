{ ... }:

{
  programs.yazi.flavors = {
      everforest-medium = ./flavors/everforest-medium.yazi;
      monokai-vibrant = ./flavors/monokai-vibrant.yazi;
      monokai-pro = ./flavors/monokai-pro.yazi;
      ayu-dark = ./flavors/ayu-dark.yazi;
    };

  programs.yazi.theme = {

    flavor = {
      dark = "monokai-pro";
    };


    icon = {
      prepend_dirs = [
        { name = "Anotações"; text = ""; }
        { name = "Arduino"; text = ""; }
        { name = "Documentos"; text = ""; }
        { name = "Imagens"; text = ""; }
        { name = "Jogos"; text = "󰮂"; }
        { name = "Musicas"; text = ""; }
        { name = "Objetos"; text = "󰆧"; }
        { name = "Playground"; text = "󱊈"; }
        { name = "Projetos"; text = ""; }
        { name = "server"; text = "󰒋"; }
      ];
    };
  };
}
