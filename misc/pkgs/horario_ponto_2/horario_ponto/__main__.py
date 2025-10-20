import argparse

from horario_ponto.cache import Cache
from horario_ponto.cookie import Cookie
from horario_ponto.ponto_repository import PontoRepository
from horario_ponto.scrapper_ggp import ScrapperGGP
from horario_ponto.constants import COOKIE_TYPE


cookie = Cookie(COOKIE_TYPE)
scrapper_ggp = ScrapperGGP(cookie)
cache = Cache(scrapper_ggp)
ponto_repository = PontoRepository(cache)

def main():
    parser = argparse.ArgumentParser(description='Gerenciador de horário de ponto')
    parser.add_argument('--hoje', action='store_true', help='Obter horário de ponto de hoje')
    parser.add_argument('--registros', action='store_true', help='Obter todos os registros de pontos salvos')
    parser.add_argument('--mes', type=int, help='Obter pontos do mês especificado (1-12)')
    
    args = parser.parse_args()
    
    if args.hoje:
        horario_hoje = ponto_repository.horario_ponto()
        print(horario_hoje)
        return
    
    if args.mes:
        if 1 <= args.mes <= 12:
            registros = ponto_repository.registros_mes(args.mes)
            print(registros)
        else:
            print("Erro: Mês deve ser entre 1 e 12")
        return

    if args.registros:
        registros = ponto_repository.registros()
        print(registros)
        return 
    
    horario_hoje = ponto_repository.horario_ponto()
    print(horario_hoje)
    return



if __name__ == "__main__":
    main()
