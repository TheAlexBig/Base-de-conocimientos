
and(A,B,S):-
    \==(A,B),
    is(S,0).

and(A,B,S):-
    ==(A,B),
    is(S,1).

or(A,B,S):-
    A==1,
    ==(A,B),
    is(S,1).

or(A,B,S):-
    \==(A,B),
    is(S,1).

or(A,B,S):-
     0==A,
     0==B,
     is(S,0).

xor(A,B,S):-
    \==(A,B),
    is(S,1).

xor(A,B,S):-
    ==(A,B),
    is(S,0).

negacion(A,S):-
    A==1,
    S is 0.
negacion(A,S):-
    A==0,
    S is 1.

nand(A,B,S):-
    A==1,
    A==B,
    S is 0.
nand(A,B,S):-
    A==0,
    A\==B,
    S is 1.

nor(A,B,S):-
    \==(A,B),
    is(S,0).

nor(A,B,S):-
     0==A,
     0==B,
     is(S,1).

nxor(A,B,S):-
    \==(A,B),
    is(S,0).

nxor(A,B,S):-
    ==(A,B),
    is(S,1).













