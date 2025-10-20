from datetime import date, datetime, time
from horario_ponto.cookie import Cookie
import requests
from bs4 import BeautifulSoup
import re

class ScrapperGGP:
    def __init__(self, cookie: Cookie = Cookie()):
        self.cookie = cookie
        self.url = "https://egesp.tce.go.gov.br/portal/frequencia/espelho_ponto/index_meu_espelho"

    def buscar_html(self, **params) -> str:
        headers = {"Cookie": self.cookie.value, "User-Agent": "Mozilla/5.0"}

        response = requests.get(self.url, params=params, headers=headers)

        if response.status_code != 200:
            print(f"Erro HTTP {response.status_code}")
            raise RuntimeError("Página não encontrada")

        return response.text

    def scrap_mes(self, mes: int, ano: int) -> dict:
        html = self.buscar_html(mes=mes, ano=ano)
        hoje = date.today().day
        return {
            "entrada_hoje": self._extrair_horario_entrada_hoje(html, str(hoje)),
            "dias": self._extrair_todos_horarios(html)
        }
        
    def _extrair_horario_entrada_hoje(self, html: str, dia_formatado: str) -> time | None:
        soup = BeautifulSoup(html, "html.parser")
        div_tabela = soup.find("div", id="grid_espelho_ponto_22413")

        if div_tabela is None:
            print(
                "❌ Erro: Cookie inválido ou sessão expirada. Página protegida não acessível."
            )
            print("Apagando cookies antigos")
            Cookie.clear()

        tabela = div_tabela.find("table")
        if not tabela:
            return None

        entrada_hoje = None
        for linha in tabela.find_all("tr"):
            tds = linha.find_all("td")
            for i, td in enumerate(tds):
                if not dia_formatado in td.get_text(strip=True):
                    continue
                registros_td = tds[i + 1] if i + 1 < len(tds) else None
                if not registros_td:
                    continue
                for span in registros_td.find_all("span"):
                    texto = span.get_text(strip=True)
                    if "(E)" in texto:
                        entrada_hoje = texto.split("(")[0]
                        break
        if not entrada_hoje:
            return None
        
        return datetime.strptime(entrada_hoje, "%H:%M").time()

    def _extrair_todos_horarios(self, html: str) -> list[dict]:
        """ Extrai horários de entrada e saída do espelho de ponto. """
        soup = BeautifulSoup(html, 'html.parser')
        
        # Encontrar a tabela com os registros de ponto
        tabela = soup.find_all('table', class_='table-striped')[1]
        
        if not tabela:
            return []
        
        # Encontrar todas as linhas do corpo da tabela
        linhas = tabela.find('tbody').find_all('tr')
        
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



    def _obter_dia_hoje_formatado(self) -> str:
        dias_semana_pt = ["Seg", "Ter", "Qua", "Qui", "Sex", "Sáb", "Dom"]
        hoje = date.today()
        numero_dia = hoje.day
        nome_dia = dias_semana_pt[hoje.weekday()]
        return f"{numero_dia:02d}-{nome_dia}"
