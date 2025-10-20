from datetime import date
from pathlib import Path
from bs4 import BeautifulSoup
import requests
import sys

from horario_ponto.cookie import Cookie

CACHE_PATH = Path.home() / '.local/share/horario_ponto/cache.json'

def extrair_horario_entrada(html: str, dia_formatado: str) -> str | None:
    soup = BeautifulSoup(html, "html.parser")
    div_tabela = soup.find("div", id="grid_espelho_ponto_22413")

    if div_tabela is None:
        print(
            "❌ Erro: Cookie inválido ou sessão expirada. Página protegida não acessível."
        )
        print("Apagando cookies antigos")
        Cookie.clear()
        sys.exit(2)


    tabela = div_tabela.find("table")
    if not tabela:
        return None



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
                    return texto.split("(")[0]
    return None

def obter_horario_entrada():
    cache = Cache.load()
    # Se cache atualizado, receba!
    if cache and cache.ultima_alteracao == date.today():
        return cache.horario_entrada

    horario_entrada = buscar_horario_na_internet()

    # Se encontrou, atualize e receba!
    if horario_entrada:
        cache.horario_entrada = horario_entrada
        cache.ultima_alteracao = date.today()
        cache.save()

    return horario_entrada



