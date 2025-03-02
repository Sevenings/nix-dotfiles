{ ... }:

{
  programs.yazi.theme = {

    flavor = {
      dark = "everforest-medium";
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
