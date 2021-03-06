%Juego del granjero que debe cruzar un r�o y lleva con
%�l una gallina, una zorra y unos granos.
%Debe cruzar el r�o en una lancha en la que solo cabe
%�l y un objeto m�s.
%En ning�n momento pueden quedar solos, de cualquiera de los
%lados del r�o: la zorra y la gallina, o la gallina y
%los granos.

%Consulta: juego_granjero([izquierda, izquierda, izquierda, izquierda]).
%Solo la primera vez puede haber una orilla del rio sola.

juego_granjero([Granjero, Zorra, Gallina, Granos]):-
	EstadoInicial = [[Granjero, Zorra, Gallina, Granos]],
	juego_granjero1([Granjero, Zorra, Gallina, Granos], EstadoInicial).

juego_granjero1([derecha, derecha, derecha, derecha], Estados):-
	write('FIN DEL JUEGO'), nl, nl,
	write(Estados), nl, nl.
juego_granjero1([Granjero, Zorra, Gallina, Granos], Estados):-
	cruzando_Rio([Granjero, Zorra, Gallina, Granos], Estados).

cruzando_Rio(Ubicacion, Estados):-
	ir_Otra_Orilla(Ubicacion, Ubicacion2),
	guardar_Estado_Orillas(Estados, Estados2, Ubicacion2),
	juego_granjero1(Ubicacion2, Estados2).

ir_Otra_Orilla(Ubicacion, Ubicacion2):-
	trasladar(Ubicacion, Ubicacion2),
	\+ mala_Ubicacion(Ubicacion2).

% El orden en cada lista es: Campesino, Zorra, Gallina, Granos.
trasladar([izquierda, izquierda, Gallina, Granos], [derecha, derecha, Gallina, Granos]).
trasladar([derecha, derecha, Gallina, Granos], [izquierda, izquierda, Gallina, Granos]).

trasladar([izquierda, Zorra, izquierda, Granos], [derecha, Zorra, derecha, Granos]).
trasladar([derecha, Zorra, derecha, Granos], [izquierda, Zorra, izquierda, Granos]).

trasladar([izquierda, Zorra, Gallina, izquierda], [derecha, Zorra, Gallina, derecha]).
trasladar([derecha, Zorra, Gallina, derecha], [izquierda, Zorra, Gallina, izquierda]).

trasladar([izquierda, Zorra, Gallina, Granos], [derecha, Zorra, Gallina, Granos]).
trasladar([derecha, Zorra, Gallina, Granos], [izquierda, Zorra, Gallina, Granos]).

mala_Ubicacion([izquierda, derecha, derecha, izquierda]).
mala_Ubicacion([derecha, izquierda, izquierda, derecha]).
mala_Ubicacion([derecha, derecha, izquierda, izquierda]).
mala_Ubicacion([izquierda, izquierda, derecha, derecha]).

guardar_Estado_Orillas(Estados, Estados2, Ubicacion2):-
	revisar(Estados, Ubicacion2),
	Estados2 = [Ubicacion2|Estados].

revisar([], _).
revisar([EstadoAnt|EstadosAnt], Ubicacion2):-
	Ubicacion2 \== EstadoAnt,
	revisar(EstadosAnt, Ubicacion2).
















