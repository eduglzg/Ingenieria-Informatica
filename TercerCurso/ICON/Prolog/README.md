<h1 align="center">
  <br>
  Prolog
  <br>
</h1>

<br>

<p align="left">

## Automata de Pila

Es una maquina de estados con una memoria (Pila). Permite resolver problemas mas complejos que una maquina de estados simple, ya que es posible almacenar datos en la pila(Ej: reconocedores de cadenas del tipo a^n b^n).

<br>

En un automata de pila para reconocer cadenas tenemos tres tipos de clausulas basicas:

<br>

1. valida: Es la operacion inicial del automata. Lanza la operacion transita y comprueba el resultado final.

2. transita: Selecciona el siguiente caracter de la cadena y lanza la operacion "mueve".

3. mueve: Lleva a cabo la transicion de la maquina de estados y opcionalmente una operacion sobre la pila (añadir/eliminar elementos). 

<br>

## Meta-Interprete

Un metainterprete es un programa prolog capaz de ejecutar programas prolog.

<br>

Está formado por 3 partes principales:

1. Caso base: Cuando se encuentra una clausula sin cuerpo (hecho) que unifica con la meta que se busca.

```
solve(true).
```

2. Caso recursivo: Cuando la clausula a resolver es una disyuncion de literales (Ej: p(a,b), q(a).). Se resuelve primero la el literal A y luego el literal B (equivalente a la estrategia primero por la izquierda).
```
solve((A,B)):- solve(A), solve(B).
```

3. Caso principal: Se intenta resolver la meta A buscando una clausula cuya cabeza unifique con A y en caso de que la clausula tenga cuerpo se resuelve.

* (Funcionamiento de "clause(A,B)": Busca una clausula cuya cabeza unifique con A y almacena su cuerpo en B)

```
solve(A):- clause(A,B), solve(B).
```
</p>
