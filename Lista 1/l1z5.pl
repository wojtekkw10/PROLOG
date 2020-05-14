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
/* poprawny */

/*le(0,0).
le(1,1).
le(0,1).
le(0,2).
le(1,2).*/
/*brak zwrotnosci*/

/*le(0,0).
le(1,1).
le(2,2).
le(0,1).
le(1,2).*/
/*brak tranzytywnosci */ 

/*le(0,0).
le(1,1).
le(2,2).
le(0,1).
le(0,2).
le(1,2).
le(2,1).*/

/*brak antysymetrii */ 

czesciowy_porzadek() :-
	\+ (le(X,Y), \+ le(X,X)),
    \+ (le(X,Y), \+ le(Y,Y)),
    \+ (le(X,Y), le(Y, Z), \+ (le(X, Z))),
    \+ (le(X,Y), le(Y,X), X\=Y).

