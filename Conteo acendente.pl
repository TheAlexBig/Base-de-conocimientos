
conteo(Meta):-
    contador(Meta,1).

contador(Meta,Contador):-
    Contador==Meta,
    is(Acum,Contador),
    write(Acum),!.

contador(Meta,Contador):-
    Contador<Meta,
    write(Contador),
    is(Acum,Contador+1),
    contador(Meta,Acum).


conteo_posposicion(Meta):-
    contador_posposicion(Meta),
    write(Meta).

contador_posposicion(Meta):-
    Meta==1,
    !.

contador_posposicion(Meta):-
    Meta>1,
    is(Acum,-(Meta,1)),
    contador_posposicion(Acum),
    write(Acum).

euclides(X,Y):-
    ==(0,mod(X,Y)),
    !.

euclides(X,Y):-
    is(Residuo, mod(X,Y)),
    Residuo>0,
    writeln(Residuo),
    euclides(Y,Residuo).


reverse(X):-
    ciclo(X,Y).







