%Que tipo de comida son
entrada(paella).
entrada(consome).
entrada(gazpacho).

plato_fuerte(filete_cerdo).
plato_fuerte(pollo_asado).
plato_fuerte(trucha).
plato_fuerte(bacalao).

postre(nueces_miel).
postre(naranja).

bebida(soda).
bebida(limonada).

calorias(paella,200).
calorias(gazpacho,150).
calorias(consome,300).
calorias(filete_cerdo,400).
calorias(pollo_asado,280).
calorias(trucha,160).
calorias(bacalao,300).
calorias(nueces_miel,500).
calorias(naranja,50).
calorias(limonada,22).
calorias(soda,139).


comida_equilibrada(X,Y,Z):-
    valor_calorico(X,Y,Z,V),
    =<(V,800).

valor_calorico(X,Y,Z,V):-
    calorias(X,CX),
    calorias(Y,CY),
    calorias(Z,CZ),
   is(V,+(CX,+(CY,CZ))).

comida_limitada(Entrada,Plato_fuerte,Postre,Bebida,Limite):-
    entrada(Entrada),
    calorias(Entrada,EntradaW),
    plato_fuerte(Plato_fuerte),
    calorias(Plato_fuerte,Plato_fuerteX),
    postre(Postre),
    calorias(Postre,PostreY),
    bebida(Bebida),
    calorias(Bebida,BebidaZ),
    >=(Limite,+(EntradaW,+(Plato_fuerteX,+(PostreY,BebidaZ)))).































