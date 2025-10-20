from bs4 import BeautifulSoup
import re

def extrair_horarios_ponto(html_string):
    """
    Extrai horários de entrada e saída do espelho de ponto.
    
    Args:
        html_string: String contendo o HTML da página
        
    Returns:
        Lista de dicionários com 'dia', 'entrada' e 'saida'
    """
    soup = BeautifulSoup(html_string, 'html.parser')
    
    # Encontrar a tabela com os registros de ponto
    tabela = soup.find_all('table', class_='table-striped')[1]
    print(tabela)
    
    if not tabela:
        return []
    
    # Encontrar todas as linhas do corpo da tabela
    linhas = tabela.find('tbody').find_all('tr')
    print(linhas)
    
    registros = []
    
    for linha in linhas:
        # Encontrar todas as células da linha
        celulas = linha.find_all('td')
        
        if len(celulas) < 3:
            continue
        
        # Extrair o dia (segunda célula geralmente)
        celula_dia = celulas[1]
        span_dia = celula_dia.find('span')
        
        if not span_dia:
            continue
            
        texto_dia = span_dia.get_text(strip=True)
        
        # Extrair apenas o número do dia (ex: "01-Qua" -> "01")
        match_dia = re.match(r'(\d+)', texto_dia)
        if not match_dia:
            continue
            
        dia = match_dia.group(1)
        print(dia)
        
        # Extrair horários (terceira célula)
        celula_horarios = celulas[2]
        spans_horarios = celula_horarios.find_all('span', class_='horarios_espelho_ponto info')
        
        entrada = None
        saida = None
        
        # Processar os horários encontrados
        for span in spans_horarios:
            texto = span.get_text(strip=True)
            
            # Verificar se é entrada (E) ou saída (S)
            if '(E)' in texto:
                # Extrair apenas o horário (ex: "07:29(E)" -> "07:29")
                entrada = texto.replace('(E)', '')
            elif '(S)' in texto:
                saida = texto.replace('(S)', '')
        
        # Adicionar apenas se houver pelo menos entrada ou saída
        if entrada or saida:
            registros.append({
                'dia': dia,
                'entrada': entrada,
                'saida': saida
            })
        else:
            registros.append({
                'dia': dia,
                'fim_de_semana': True
            })
    
    return registros


# Exemplo de uso
if __name__ == "__main__":
    # Supondo que você tenha o HTML em uma string ou arquivo
    # com open('site.html', 'r', encoding='utf-8') as f:
    #     html_content = f.read()
    
    # Para testar, você pode usar:
    # resultados = extrair_horarios_ponto(html_content)
    
    # Exemplo com HTML de teste
    html_teste = None
    with open("site.html") as file:
        html_teste = file.read()
    resultados = extrair_horarios_ponto(html_teste)
    
    # Exibir resultados
    for registro in resultados:
        fim_de_semana = registro.get('fim_de_semana', False)
        if fim_de_semana:
            continue
        print(f"Dia {registro['dia']}: Entrada: {registro['entrada']}, Saída: {registro['saida']}")
