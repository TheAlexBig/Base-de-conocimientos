madre(josefina,mario).
madre(josefina,ligia).
madre(silvia,marina).
madre(silvia,jaime).
madre(silvia,carlos).
madre(ligia,regina).
madre(ligia,jacinta).

padre(manuel,mario).
padre(manuel,ligia).
padre(mario,marina).
padre(mario,jaime).
padre(mario,carlos).
padre(julio,regina).
padre(julio,jacinta).

relacion(josefina,manuel).
relacion(manuel,josefina).
relacion(ligia,julio).
relacion(julio,ligia).
relacion(silvia,mario).
relacion(mario,silvia).

sexo(josefina,femenino).
sexo(ligia,femenino).
sexo(silvia,femenino).
sexo(regina,femenino).
sexo(jancinta,femenino).
sexo(marina,femenino).

sexo(manuel,masculino).
sexo(mario,masculino).
sexo(jaime,masculino).
sexo(julio,masculino).
sexo(carlos,masculino).

femenino(josefina).
femenino(marina).
femenino(ligia).
femenino(silvia).
femenino(regina).
femenino(jancinta).

masculino(manuel).
masculino(mario).
masculino(jaime).
masculino(julio).
masculino(carlos).

masculino().

abuela(X,Y):-
  madre(X,W),
  madre(W,Y).

abuela(X,Y):-
  madre(X,W),
  padre(W,Y).

abuelo(X,Y):-
  padre(X,W),
  madre(W,Y).

abuelo(X,Y):-
  padre(X,W),
  padre(W,Y).

abuelos(X,Y):-
  abuela(X,Y).

abuelos(X,Y):-
  abuela(X,Y).

hermano(X,Y):-
  sexo(X,masculino),
  padre(P,X),
  padre(P,Y),
  \==(X,Y),
  madre(M,X),
  madre(M,Y).
hermana(X,Y):-
  sexo(X,femenino),
  padre(P,X),
  padre(P,Y),
  \==(X,Y),
  madre(M,X),
  madre(M,Y).


tio(X,Y):-
   hermano(X,W),
   padre(W,Y).

tio(X,Y):-
  hermano(X,W),
  madre(W,Y).

tia(X,Y):-
  hermana(X,W),
  padre(W,Y).

tia(X,Y):-
  hermana(X,W),
  madre(W,Y).


tios(X,Y):-
  tia(X,Y).
tios(X,Y):-
  tio(X,Y).



















