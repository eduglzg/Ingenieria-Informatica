%Base de conocimiento para pruebas
conectado(w2, w1).
conectado(w3, w2).
valor(w1, 1).
valor(W,X):-conectado(W,V), valor(V,X).

%Meta-interprete vanila
solve(true).
solve((A,B)):-solve(A),solve(B).
solve(A):-clause(A,B),solve(B).

%Meta-interprete vanila mejorado
solve_m(true):-!.
solve_m((A,B)):-!,solve_m(A),solve_m(B).
solve_m(A):-!,clause(A,B),solve_m(B).

%Meta-interprete primero a la derecha
solve_r(true):- !.
solve_r((A,B)):- !, solve_r(B), solve_r(A).
solve_r(A):- !, clause(A,B), solve(B).

%Meta-interprete valores predefinidos
solve_builtin(true):-!.
solve_builtin((A,B)):-!,solve_builtin(A),solve_builtin(B).
solve_builtin(A):- builtin(A),!,A.
solve_builtin(A):- !,clause(A,B), solve_builtin(B).

%Meta-interprete con pruebas
solve_proof(true,true):-!.
solve_proof((A,B),(ProofA,ProofB)):- solve_proof(A,ProofA),solve_proof(B,ProofB).
solve_proof(A,(A:-Proof)):- clause(A,B),solve_proof(B,Proof).

%Meta-interprete con traza
solve_traza(true):-!.
solve_traza((A,B)):- solve_traza(A),solve_traza(B).
solve_traza(A):- write('Call: '),write(A),nl,clause(A,B),solve_traza(B),write('Exit: '),write(A),nl.

%Meta-interprete con traza y tabulaciones.
solve_traza_tab(true,_):-!.
solve_traza_tab((A, B),N) :-!,solve_traza_tab(A,N), solve_traza_tab(B,N).
solve_traza_tab(A, N):-tab(N*3),write('Call: '), write(A), nl,clause(A,B), N1 is N+1,solve_traza_tab(B,N1),tab(N*3),write('Exit: '), write(A), nl.

solve_traza_tab(A):- solve_traza_tab(A,0).


%Meta-interprete que resuelve hasta una profundidad
solve_prof(true,_):-!.
solve_prof((A,B),Prof):-!,Prof > 0,Prof1 is Prof - 1,solve_prof(A,Prof1),solve_prof(B,Prof1). 
solve_prof(A,Prof):- !,Prof > 0, clause(A,B), Prof1 is Prof - 1,solve_prof(B,Prof1).

%Meta-interprete con metas diferidas 
solve_dif(true,D,D):-!.
solve_dif((A,B),D1,D2):-!,solve_dif(A,D1,D3),solve_dif(B,D2,D3).
solve_dif(A,D,[D1|D]):- delay(A).
solve_dif(A,D1,D2):-clause(A,B),solve_dif(B,D1,D2).

%Definicion de operadores.
:op(40,xfy,&).
:op(50,xfy,--->).

%Meta-interprete con ampliacion del lenguaje
solve_amp(true):-!.
solve_amp((A & B)):- !, solve_amp(A), solve_amp(B).
solve_amp(A):- clause(B ---> A), solve_amp(B).



%Preguntas: 
% ?- solve_traza(valor(w3,X),2).
% ?- solve_traza_tab(valor(w3,X),2).
% ?- pSolve(valor(w3,X),2).
