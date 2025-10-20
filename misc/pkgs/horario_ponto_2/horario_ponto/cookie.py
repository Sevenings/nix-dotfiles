import os
from horario_ponto.constants import COOKIE_TYPE, COOKIE_PATH


class Cookie:
    """ Classe que carrega o valor do Cookie de autenticação na memória """

    def __init__(self, type_: str = COOKIE_TYPE) -> None:
        self._value = None
        self.type = type_

    @property
    def value(self) -> str:
        if not self._value:
            self.load()
        return self._value

    def load(self):
        cookie_path = COOKIE_PATH
        cookie_path.parent.mkdir(parents=True, exist_ok=True)

        if not cookie_path.exists():
            print("Cookie de autenticação não encontrado.")
            novo_cookie = input("Por favor, insira o valor do cookie: ").strip()
            with open(cookie_path, "w") as f:
                cookie = f"{self.type}={novo_cookie}"
                f.write(cookie)
            os.chmod(cookie_path, 0o600)
            print(f"Cookie salvo em {cookie_path}")

        with open(cookie_path, "r") as f:
            self._value = f.read().strip()

    @staticmethod
    def clear() -> None:
        """ Apaga cookies antigos """
        os.remove(COOKIE_PATH)

