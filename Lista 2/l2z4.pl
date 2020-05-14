reguła(X, +, Y, Y) :-
	number(X),
	X =:= 0.
reguła(X, +, Y, X) :-
	number(Y),
	Y =:= 0.
reguła(X, +, Y, X+Y).


reguła(X, -, X, 0).
reguła(X, -, 0, X).
reguła(X, -, Y, X-Y).


reguła(X, *, Y, Y) :-
	number(X),
	X =:= 1.
reguła(X, *, Y, X) :-
	number(Y),
	Y =:= 1.
reguła(X, *, Y, 0) :-
	number(Y),
	Y =:= 0.
reguła(X, *, Y, 0) :-
	number(X),
	X =:= 0.
reguła(X, *, Y, X*Y).


reguła(X, /, X, 1).
reguła(X, /, 1, X).
reguła(X, /, Y, X/Y).

uprosc(X, X) :-
	number(X).


uprosc(X+Y, Z1) :-
	number(X), number(Y), Z1 is X+Y;
	uprosc(Y, Y1), uprosc(X, X1), reguła(X1, +, Y1, Z), \+ X+Y = Z, uprosc(Z, Z1);
	uprosc(Y, Y1), uprosc(X, X1), reguła(X1, +, Y1, Z1).
	

uprosc(X-Y, Z1) :-
	number(X), number(Y), Z1 is X-Y;
	uprosc(Y, Y1), uprosc(X, X1), reguła(X1, -, Y1, Z), \+ X-Y = Z, uprosc(Z, Z1);
	uprosc(Y, Y1), uprosc(X, X1), reguła(X1, -, Y1, Z1).

uprosc(X*Y, Z1) :-
	number(X), number(Y), Z1 is X*Y;
	uprosc(Y, Y1), uprosc(X, X1), reguła(X1, *, Y1, Z), \+ X*Y = Z, uprosc(Z, Z1);
	uprosc(Y, Y1), uprosc(X, X1), reguła(X1, *, Y1, Z1).

uprosc(X/Y, Z1) :-
	number(X), number(Y), Z1 is X/Y;
	uprosc(Y, Y1), uprosc(X, X1), reguła(X1, /, Y1, Z), \+ X/Y = Z, uprosc(Z, Z1);
	uprosc(Y, Y1), uprosc(X, X1), reguła(X1, /, Y1, Z1). 
uprosc(X,X).

