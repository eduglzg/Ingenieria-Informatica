%Author: Canallita


%Estado inicial: La pila esta vacia (porque solo esta el caracter de fondo de
% pila z) y se recibe a -> seguimos en el estado q0 y añadimos 'a' a la pila 
mueve(q0,a,[z],q0,[a|z]).

%Acciones para el estado q0: si llega 'a' -> lo añadimos a la pila y seguimos
% en q0, si llega 'b' -> Empezamos a eliminar las 'a' de la pila y pasamos a q1 
mueve(q0,a,H,q0,[a|H]).
mueve(q0,b,[a|H],q1,H).

%Acciones para q1: si llega 'b' y quedan 'a' en la pila -> eliminamos una 'a' y
% seguimos en q1, si llega 'b' y no quedan 'a' en la pila -> añadimos 'b' a la 
% pila y pasamos a q2   
mueve(q1,b,[a|H],q1,H).
mueve(q1,b,z,q2,[b|z]).

%Acciones para q2: si llega 'b' -> la añadimos a la pila y seguimos en q2
% si llega 'c' -> empezamos a eliminar 'b' de la pila y pasamos a q3
mueve(q2,b,H,q2,[b|H]).
mueve(q2,c,[b|H],q3,H).

%Acciones para q3: Segun llegan las 'c' -> eliminamos las 'b' de la pila
mueve(q3,c,[b|H],q3,H).

%Caso base de transita. Si el estado autual es q3, no llegan mas caracteres y
%la pila está vacia se ha alcanzado el estado final(qf).
transita(q3,[],z,qf,[z]).

%Se selecciona el siguiente caracter de la cadena y se comprueba si coincide 
%con alguna de las acciones descritas.
transita(Qi,[X|Y],Z,Qf,Zf):-mueve(Qi,X,Z,Qs,Zs),transita(Qs,Y,Zs,Qf,Zf).

%Pasa la cadena introducida a transita, comprueba si el estado obtenido como final
% es el final y devuelve 1 si todo ha ido bien. 
valida(Cadena,Resultado):- transita(q0,Cadena,[z],Qf,_), Qf=qf, Resultado is 1,!.
