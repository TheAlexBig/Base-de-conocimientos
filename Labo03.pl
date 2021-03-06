%Ejercicio 01
arbol:-
    abolish(padre,2),
    abolish(madre,2),
    arbolrec.

arbolrec:-
    write('Digite p(padre), m(madre) o s(salir): '),
    read(Opcion),
    ciclo(Opcion).

ciclo('p'):-
    write('Nombre del padre: '),
    read(Padre),
    write('Nombre del hijo: '),
    read(Hijo),
    assert(padre(Padre,Hijo)),
    arbolrec.

ciclo('m'):-
    write('Nombre de la madre: '),
    read(Madre),
    write('Nombre del hijo: '),
    read(Hijo),
    assert(madre(Madre,Hijo)),
    arbolrec.

ciclo('s'):-
    !.

%Ejercicio 02


antepasados(X):-
   \+padre(_,X),
   \+madre(_,X),fail.

antepasados(X):-
    padre(Y,X),
    writeln(Y),
    antepasados(Y),!.

antepasados(X):-
    madre(Y,X),
    writeln(Y),
    antepasados(Y),!.

%Ejercicio 03
paso(1, medicion).
paso(2, corte).
paso(3, moldeado).
paso(4, pulido).
paso(5, montaje).
paso(6, empacado).
paso(7, almacenaje).

prox_etapa(X):-
    >=(X,0),
    =<(X,7),
    etapa(X,7),!.

prox_etapa(_):-
    writeln('Valor erroneo').

etapa(X,Y):-
    <(X,Y),
    is(Xaux,+(X,1)),
    paso(Xaux,Z),
    writeln(Z),
    etapa(Xaux,Y).

etapa(7,7):-
    write('Proceso Concluido').

%Ejercicio 04
era(precambrica).
era(paleozoica).
era(mezoica).
era(neozoica).
era(cuaternaria).

le_sigue(algonquico,arcaico).
le_sigue(arcaico,cambrico).
le_sigue(cambrico,silurico).
le_sigue(silurico,carbonifero).
le_sigue(carbonifero,devonico).
le_sigue(devonico,permico).
le_sigue(permico,jurasico).
le_sigue(jurasico,cretacido).
le_sigue(cretacido,triasico).
le_sigue(triasico,eoceno).
le_sigue(eoceno,oligoceno).
le_sigue(oligoceno,mioceno).
le_sigue(mioceno,pleistoceno).
le_sigue(pleistoceno,holoceno).

le_pertenece(precambrica,algonquico).
le_pertenece(precambrica,arcaico).
le_pertenece(paleozoica,cambrico).
le_pertenece(paleozoica,silurico).
le_pertenece(paleozoica,carbonifero).
le_pertenece(paleozoica,devonico).
le_pertenece(paleozoica,permico).
le_pertenece(mezoica,jurasico).
le_pertenece(mezoica,cretacido).
le_pertenece(mezoica,triasico).
le_pertenece(neozoica,eoceno).
le_pertenece(neozoica,oligoceno).
le_pertenece(neozoica,mioceno).
le_pertenece(cuaternaria,pleistoceno).
le_pertenece(cuaternaria,holoceno).

%Literal A)
periodos_anteriores(X):-
    le_sigue(Y,X),
    writeln(X),
    periodos_anteriores(Y),!.

periodos_anteriores(algonquico):-
    writeln('algonquico'),!.

periodos_anteriores(_):-
    writeln('Periodo erroneo').

%Literal B)
periodos_siguientes(X):-
    le_sigue(X,Y),
    writeln(X),
    periodos_siguientes(Y),!.

periodos_siguientes(X):-
    \+le_sigue(X,_),
    writeln(X),!.

periodos_siguientes(_):-
    writeln('Periodo erroneo').

%Literal B) modificado
periodos_siguientes2(X):-
    le_sigue(X,Y),
    writeln(X),
    periodos_siguientes2(Y),!.

periodos_siguientes2(X):-
    \+le_sigue(X,_),
    le_sigue(_,X),
    writeln(X),!.

periodos_siguientes2(_):-
    writeln('Periodo erroneo').

%Literal C)
periodos(Era):-
    le_pertenece(Era,Periodo),
    writeln(Periodo),
    fail.







%Literal C) modificado
periodos2(Era):-
    abolish(mostrado,1),
    assert(mostrado(para_que_no_de_error)),
    periodos_rec(Era),!.

periodos_rec(Era):-
    le_pertenece(Era,Periodo),
    \+mostrado(Periodo),
    assert(mostrado(Periodo)),
    periodos_rec(Era),
    writeln(Periodo).

periodos_rec(Era):-
    le_pertenece(Era,_).

%Ejercicio 05
conecta_con(calle,cochera).
conecta_con(cochera,calle).
conecta_con(cochera,sala).
conecta_con(sala,cochera).
conecta_con(sala,pasillo1).
conecta_con(pasillo1,sala).
conecta_con(comedor,pasillo1).
conecta_con(pasillo1,comedor).
conecta_con(bano,pasillo1).
conecta_con(pasillo1,bano).
conecta_con(cocina,pasillo1).
conecta_con(pasillo1,cocina).
conecta_con(cocina,lavadero).
conecta_con(lavadero,cocina).
conecta_con(cocina,lavadero).
conecta_con(pasillo1,lavadero).
conecta_con(lavadero,pasillo1).
conecta_con(pasillo1,pasillo2).
conecta_con(pasillo2,pasillo1).
conecta_con(cuarto_de_papas,pasillo2).
conecta_con(pasillo2,cuarto_de_papas).
conecta_con(cuarto_de_rodri,pasillo2).
conecta_con(pasillo2,cuarto_de_rodri).
conecta_con(pasillo2,jardin).
conecta_con(jardin,pasillo2).
conecta_con(quiosco,jardin).
conecta_con(jardin,quiosco).

ir_hacia(A,B):- abolish(visitado,1),
	assert(visitado(A)),
	ir(A,B),
	writeln(A),!.

ir(A,B):- conecta_con(A,B),
	writeln(B),
	assert(visitado(B)).

ir(A,B):- conecta_con(A,C),
	\+visitado(C),
	assert(visitado(C)),
	ir(C,B),
	writeln(C).

















