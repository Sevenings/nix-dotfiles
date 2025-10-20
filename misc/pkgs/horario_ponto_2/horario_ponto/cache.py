from datetime import date, time

from horario_ponto.scrapper_ggp import ScrapperGGP
from horario_ponto.models import ConteudoCache, RegistroPonto
import pickle
from pathlib import Path



class Cache:
    """ 
    Classe responsável por gerenciar os dados do cache.

    Ela retorna: 
        - horario em que eu entrei no dia de hoje.
        - lista de meus horarios de ponto em determinado mês.

    Caso o dados ainda não esteja em cache, ou esteja vencido, 
    ela faz scrapping, salva e retorna o novo dado.
    """
    def __init__(self, scrapper_ggp: ScrapperGGP):
        self.scrapper_ggp = scrapper_ggp
        self.cache_path = "cache.pkl"

    """ Propriedades """

    @property
    def entrada_hoje(self) -> time:
        if not self._atualizado:
            este_mes = date.today().month
            este_ano = date.today().year
            self._atualizar_mes(este_mes, este_ano)
        cache = self._carregar_cache()
        return cache.entrada_hoje

    @property
    def registros(self) -> list[RegistroPonto]:
        cache = self._carregar_cache()
        return cache.registros


    """ Operações com os dados em cache """

    @property
    def _atualizado(self) -> bool:
        return False

    def _atualizar_mes(self, mes: int, ano: int):
       """ Baixa a página do mês e salva os dados no banco """
       dados_mes = self.scrapper_ggp.scrap_mes(mes, ano)

       # Salvar os dados no cache
       cache = self._carregar_cache()
       cache.entrada_hoje = dados_mes.get("entrada_hoje", cache.entrada_hoje)

       print(cache)
       self._salvar_cache(cache)

    """ Manipulações do arquivo de cache """

    def _carregar_cache(self) -> ConteudoCache:
        if not Path(self.cache_path).exists():
            novo_cache = ConteudoCache()
            self._salvar_cache(novo_cache)
            return novo_cache

        with open(self.cache_path, 'rb') as f:
            return pickle.load(f)

    def _salvar_cache(self, cache: ConteudoCache):
        cache.data = date.today()
        with open(self.cache_path, 'wb') as f:
            pickle.dump(cache, f)

    def _inserir_registro(self, cache: ConteudoCache, registro_ponto: RegistroPonto):
        cache.registros.append(registro_ponto)        

