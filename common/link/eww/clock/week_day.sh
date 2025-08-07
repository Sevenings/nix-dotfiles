#!/bin/sh

dia=$(date +%w)

dias=(Domingo "Segunda-feira" "Terça-feira" "Quarta-feira" "Quinta-feira" "Sexta-feira" Sábado)

echo ${dias[$dia]}
