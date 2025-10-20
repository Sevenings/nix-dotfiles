from dataclasses import dataclass, field
from datetime import date, time


@dataclass
class RegistroPonto:
    dia: date
    entrada: time
    saida: time


@dataclass
class ConteudoCache:
    data: date = date.today()
    entrada_hoje: time = time()
    registros: list[RegistroPonto] = field(default_factory=list)

