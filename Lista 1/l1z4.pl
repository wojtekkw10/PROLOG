/*le(0,0).
le(1,1).
le(2,2).
le(3,3).
le(4,4).
le(5,5).
le(1,2).
le(1,3).
le(1,4).
le(1,5).
le(2,5).
le(2,3).
le(2,4).
le(3,4).
le(0,3).
le(0,4).*/

le(0,0).
le(1,1).
le(2,2).
le(0,1).
le(0,2).
le(1,2).

maksymalny(X) :-
    \+ (le(X,Y), X\=Y).

minimalny(X) :-
    \+ (le(Y,X), X\=Y).

najwiekszy(X) :-
   \+ (le(Y,Z), \+ le(Y, X)).

najmniejszy(X) :-
   \+ (le(Y,Z), \+ le(X, Z)).

