jednokrotnie(X, L) :-
	select(X, L, Y), \+ member(X, Y).


dwukrotnie(X, L) :-
	dwukrotnie(X, L, 0).
dwukrotnie(_, [], 2).
dwukrotnie(X, [H|T], N) :-
	X = H, N1 is N + 1, dwukrotnie(X, T, N1);
	dwukrotnie(X, T, N), X\=H.
	
