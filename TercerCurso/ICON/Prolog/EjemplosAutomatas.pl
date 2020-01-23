%Automatas de pila


%Automata reconocedor de cadenas del tipo a^n b^n 
mueve(q0,a,[z],q0,[a|z]).
mueve(q0,a,H,q0,[a|H]).
mueve(q0,b,[a|H],q1,H).
mueve(q1,b,[a|H],q1,H).

transita(q1,[],z,qf,[z]).
transita(Qi,[X|Y],Z,Qf,Zf):- mueve(Qi,X,Z,Qs,Zs),transita(Qs,Y,Zs,Qf,Zf).
valida(Cadena,Resultado):-transita(q0,Cadena,[z],Qf,_),Qf=qf, Resultado is 1,!.

%Automata reconocedor de cadenas del tipo a^r b^s c^t con s = r + t
mueve(q0,a,[z],q0,[a|z]).
mueve(q0,a,H,q0,[a|H]).
mueve(q0,b,[a|H],q1,H).
mueve(q1,b,[a|H],q1,H).
mueve(q1,b,[z],q2,[b|z]).
mueve(q2,b,H,q2,[b|H]).
mueve(q2,c,[b|H],q3,H).
mueve(q3,c,[b|H],q3,H).

transita(q3,[],z,qf,[z]).
transita(Qi,[X|Y],Z,Qf,Zf):-mueve(Qi,X,Z,Qs,Zs),transita(Qs,Y,Zs,Qf,Zf).
valida(Cadena, Resultado):- transita(q0,Cadena,[z],Qf,_), Qf = qf, Resultado is 1,!.

%Automata reconocedor de palindromos del tipo W e W^I (W^I -> W invertida)
mueve(q0,X,[z],q0,[X|z]).
mueve(q0,X,H,q0,[X|H]).
mueve(q0,e,H,q1,H).
mueve(q1,X,[Y|H],q1,H):-,X=Y.

transita(q1,[],z,qf,[z]).
transita(Qi,[X|Y],Z,Qf,Zf):-mueve(Qi,X,Z,Qs,Zs),transita(Qs,Y,Zs,Qf,Zf).
valida(Cadena,Resultado):- transita(q0,Cadena,[z],Qf,_),Qf=qf,Resultado is 1,!.
