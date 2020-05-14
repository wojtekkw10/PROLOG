srednia(L, X) :-
	srednia(L, 0, 0, X).
srednia([], ACC, LENGTH, X) :- X is ACC/LENGTH.
srednia([A|B], ACC, LENGTH, X) :-
	ACC1 is A + ACC,
	LENGTH1 is LENGTH + 1,
	srednia(B, ACC1, LENGTH1, X).




wariancja(L, X) :-
	srednia(L, AVG),
	wariancja(L, 0, 0, AVG, X).
wariancja([], ACC, LENGTH, _, X) :- X is ACC/LENGTH.
wariancja([A | B], ACC, LENGTH, AVG, X) :-
	ACC1 is (A-AVG)*(A-AVG)+ACC,
	LENGTH1 is LENGTH + 1,
	wariancja(B, ACC1, LENGTH1, AVG, X).
