%Ejercicio uno%
contar_ocurrencias(Numero,Ocurrencia,N):-
    contar(Numero,Ocurrencia,N).

contar(Numero,Ocurrencia,N):-
    <(Numero,10),
    =:=(Numero,Ocurrencia),
    is(N,1),!.

contar(Numero,_,N):-
    <(Numero,10),
    is(N,0),!.

contar(Numero,Ocurrencia,N):-
    >=(Numero,10),
    is(Modulo,mod(Numero,10)),
    =:=(Modulo,Ocurrencia),
    contar(//(Numero,10),Ocurrencia,Acumulador),
    is(N,+(Acumulador,1)),!.

contar(Numero,Ocurrencia,N):-
    >=(Numero,10),
    is(Modulo,mod(Numero,10)),
    \==(Modulo,Ocurrencia),
    contar(//(Numero,10),Ocurrencia,Acumulador),
    is(N,+(Acumulador,0)),!.

%Ejercicio dos%
contarPI(X,P,I):-
    contar_PI(X,P,I).

contar_PI(Numero,P,I):-
    <(Numero,10),
    is(Modulo, mod(Numero,2)),
    =:=(Modulo,0),
    is(P,1),
    is(I,0),!.

contar_PI(Numero,P,I):-
    <(Numero,10),
    is(Modulo, mod(Numero,2)),
    =:=(Modulo,1),
    is(P,0),
    is(I,1),!.


contar_PI(Numero,P,I):-
    >=(Numero,10),
    is(Modulo,mod(Numero,2)),
    contar_PI(//(Numero,10),AcumuladorP,AcumuladorI),
    =:=(Modulo,0),
    is(P,+(AcumuladorP,1)),
    is(I,AcumuladorI),!.

contar_PI(Numero,P,I):-
    >=(Numero,10),
    is(Modulo,mod(Numero,2)),
    contar_PI(//(Numero,10),AcumuladorP,AcumuladorI),
    =:=(Modulo,1),
    is(P,AcumuladorP),
    is(I,+(AcumuladorI,1)),!.


%Ejercicio tres%

sumatoria(K,N):-
    sumatoriaR(K,N,Con).

sumatoriaR(K,N,Con):-
    is(Con,/(1,N)),!.

sumatoriaR(K,N,Con):-
    <(K,N),
    is(KS,+(K,1)),
    sumatoriaR(KS,N,Conts),
    is(Con,+(/(1/K),Conts)),!.



















