"------------------"
"Imported Functions"
"------------------"

import os
from math import sqrt


"-------------------"
"Circuitos Eletricos"
"-------------------"

def baskara(a, b, c):
    delta = b**2 - 4*a*c
    x1 = (-b - sqrt(delta)) / 2*a
    x2 = (-b + sqrt(delta)) / 2*a
    return x1, x2

def hipotenusa(b, c):
    return sqrt(b**2 + c**2)


"-------------------"
"Circuitos Eletricos"
"-------------------"

def paralelo(a, b):
    return a*b/(a+b)


"-------------"
"    Title    "
"-------------"

os.system('clear')
print("Zenitsu's Python Calculator")

