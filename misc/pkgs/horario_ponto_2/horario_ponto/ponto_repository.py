from horario_ponto.cache import Cache
from datetime import time

class PontoRepository:
    def __init__(self, cache: Cache) -> None:
        self.cache = cache

    def horario_ponto(self) -> time:
        """ Retorna o horário que bati ponto hoje """
        return self.cache.entrada_hoje

    def registros_mes(self, mes: int):
        # return self.cache.registros
        pass

    def registros(self):
        return self.cache.registros
        
