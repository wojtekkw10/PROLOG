/*
wyrazenie(L, K, F) :-
	wyrazenie1(L, F), K is F.
wyrazenie1([A|B], F) :-
	wyrazenie1(B, A, F).	
wyrazenie1([], F, F).
wyrazenie1([A|B], EXPR, F) :-
	(EXPR1 = EXPR + A;
	EXPR1 = EXPR - A;
	EXPR1 = EXPR * A;
	EXPR1 = EXPR / A),
	wyrazenie1(B, EXPR1, F).
*/

wyrazenie(L, K, F) :-
	wyrazenie1(L, F), K is F.	

wyrazenie1(L, F) :-
	append(X, Y, L),
	\+ X = [], \+ Y = [],
	wyrazenie1(X, F1),
	wyrazenie1(Y, F2),
	(F = F1 + F2;
	F = F1 - F2;
	F = F1 * F2;
	(\+ 0 is F2, \+ 0.0 is F2, F = F1 / F2)).

wyrazenie1([X], X).
