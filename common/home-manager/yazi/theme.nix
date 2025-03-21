{ ... }:

{
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
