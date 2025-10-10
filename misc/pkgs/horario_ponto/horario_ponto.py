import json
from dataclasses import asdict, dataclass
from datetime import datetime, time, timedelta, date
from pathlib import Path
from bs4 import BeautifulSoup
import requests
import sys
import os

CACHE_PATH = Path.home() / '.local/share/horario_ponto/cache.json'

@dataclass
class Cache:
    horario_entrada: str | None
    ultima_alteracao: date | None
    
    @staticmethod
    def load():
        if not Path(CACHE_PATH).exists():
            Path(CACHE_PATH).parent.mkdir(parents=True, exist_ok=True)
            Path(CACHE_PATH).write_text("{}")
            return Cache(horario_entrada=None, ultima_alteracao=None)
        with open(CACHE_PATH) as f:
            data = json.load(f)

            ultima_alteracao = data.get("ultima_alteracao")
            if ultima_alteracao:
                ultima_alteracao = date.fromisoformat(ultima_alteracao)

            cache = Cache(
                    horario_entrada=data.get("horario_entrada", None),
                    ultima_alteracao=ultima_alteracao
                    )
        return cache

    def save(self):
        with open(CACHE_PATH, 'w') as f:
            content = dict(
                    horario_entrada=self.horario_entrada,
                    ultima_alteracao=self.ultima_alteracao.isoformat() if self.ultima_alteracao else None
                    )
            json.dump(content, f)
        



COOKIE_PATH = Path.home() / ".local/share/horario_ponto/cookie.txt"
COOKIE_TYPE = "_password_tcego_gpweb_new_session_novo"


def obter_cookie() -> str:
    cookie_path = COOKIE_PATH
    cookie_path.parent.mkdir(parents=True, exist_ok=True)

    if not cookie_path.exists():
        print("Cookie de autenticação não encontrado.")
        novo_cookie = input("Por favor, insira o valor do cookie: ").strip()
        with open(cookie_path, "w") as f:
            cookie = f"{COOKIE_TYPE}={novo_cookie}"
            f.write(cookie)
        os.chmod(cookie_path, 0o600)
        print(f"Cookie salvo em {cookie_path}")

    with open(cookie_path, "r") as f:
        return f.read().strip()


def obter_dia_hoje_formatado() -> str:
    dias_semana_pt = ["Seg", "Ter", "Qua", "Qui", "Sex", "Sáb", "Dom"]
    hoje = datetime.now()
    numero_dia = hoje.day
    nome_dia = dias_semana_pt[hoje.weekday()]
    return f"{numero_dia:02d}-{nome_dia}"


def obter_parametros_data_atual() -> dict:
    hoje = datetime.now()
    return {
        "utf8": "✓",
        "tipo_relatorio": "",
        "mes": str(hoje.month),
        "ano": str(hoje.year),
        "button": "",
    }


def buscar_html(cookie: str, params: dict) -> str:
    url = (
        "https://egesp.tce.go.gov.br/portal/frequencia/espelho_ponto/index_meu_espelho"
    )
    headers = {"Cookie": cookie, "User-Agent": "Mozilla/5.0"}

    response = requests.get(url, params=params, headers=headers)

    if response.status_code != 200:
        print(f"Erro HTTP {response.status_code}")
        sys.exit(1)

    return response.text


def extrair_horario_entrada(html: str, dia_formatado: str) -> str | None:
    soup = BeautifulSoup(html, "html.parser")
    div_tabela = soup.find("div", id="grid_espelho_ponto_22413")

    if div_tabela is None:
        print(
            "❌ Erro: Cookie inválido ou sessão expirada. Página protegida não acessível."
        )
        print("Apagando cookies antigos")
        os.remove(COOKIE_PATH)
        sys.exit(2)

    tabela = div_tabela.find("table")
    if not tabela:
        return None

    for linha in tabela.find_all("tr"):
        tds = linha.find_all("td")
        for i, td in enumerate(tds):
            if dia_formatado in td.get_text(strip=True):
                registros_td = tds[i + 1] if i + 1 < len(tds) else None
                if registros_td:
                    for span in registros_td.find_all("span"):
                        texto = span.get_text(strip=True)
                        if "(E)" in texto:
                            return texto.split("(")[0]

    return None


def calcular_saida(hora_entrada_str: str, horas_jornada: int = 5) -> str:
    hora_entrada = datetime.strptime(hora_entrada_str, "%H:%M")
    hora_saida = hora_entrada + timedelta(hours=horas_jornada)
    return hora_saida.strftime("%H:%M")


def buscar_horario_na_internet():
    # Se não, busque!
    cookie = obter_cookie()
    dia_hoje = obter_dia_hoje_formatado()
    params = obter_parametros_data_atual()
    html = buscar_html(cookie, params)
    return extrair_horario_entrada(html, dia_hoje)


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


def limpar_cache():
    if Path(CACHE_PATH).exists():
        os.remove(CACHE_PATH)
        print("Removido cache com sucesso")


def main():
    mode = sys.argv[1] if len(sys.argv) > 1 else None
    if mode and mode == "cache":
        operation = sys.argv[2] if len(sys.argv) > 2 else None
        if operation and operation == "clear":
            limpar_cache()
            sys.exit(0)
        print("Erro de sintaxe")
        sys.exit(1)

    horario_entrada = obter_horario_entrada()

    if horario_entrada:
        saida = calcular_saida(horario_entrada)
        print(f"{horario_entrada} - {saida}")
        sys.exit(0)
    else:
        print(f"Bateu o ponto?")
        sys.exit(0)


if __name__ == "__main__":
    main()
