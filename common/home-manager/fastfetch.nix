{ ... }:

{
  programs.fastfetch = {
    enable = true;
    settings = {
      # Exibe a arte ASCII do logo da distro
      ascii = true;
      # Escolha o backend para exibição de imagens (ex.: "kitty", "viu", "chafa")
      image_backend = "kitty";
      # Define quais informações serão exibidas; ajuste conforme o que deseja mostrar
      info = "os,distro,kernel,uptime,cpu,memory,wm,theme";
      # Configura cores: "auto" tenta detectar o melhor esquema para seu terminal
      colors = "auto";
      # Caso deseje personalizar a forma como as informações são exibidas, pode configurar outros parâmetros aqui
      # Por exemplo, definir seu terminal (usado na identificação):
      # terminal = "alacritty";
    };
  };
}
