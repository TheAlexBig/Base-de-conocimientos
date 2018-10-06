preorden([Si,Dato,Sd]):-
    write(Dato),
    preorden(Si),
    preorden(Sd).


preorden([]).
%Busqueda binaria

busquedabinaria([_,X,_],X):-
    writeln('Aqui esta'),
    !.

busquedabinaria([],_):-
    writeln('No se encuentra'),false.

busquedabinaria([_,Dato,Sd],X):-
    >(X,Dato),
    busquedabinaria(Sd,X).

busquedabinaria([Si,Dato,_],X):-
    <(X,Dato),
    busquedabinaria(Si,X).


%Insertar item


insertarbinario([],Insertar,[[],Insertar,[]]):-!.

insertarbinario([Ni,Raiz,Nd],Insertar,Resultado):-
    >(Insertar,Raiz),
    insertarbinario(Nd,Insertar,Aux),
    =(Resultado,[Ni,Raiz,Aux]),!.

insertarbinario([Ni,Raiz,Nd],Insertar,Resultado):-
    =<(Insertar,Raiz),
    insertarbinario(Ni,Insertar,Aux),
    =(Resultado,[Aux,Raiz,Nd]),!.




