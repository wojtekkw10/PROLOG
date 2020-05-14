uwaga0(L, X) :-
	J is X + 0, \+ (between(1, J, K), \+ member(K, L)).

lista(N, X) :-
	numlist(1, N, L),
	N1 is N // 2,
	lista(L, [], [], [], X, 0, N1).	
lista([], [], [], X, X, _, _).
lista(L, EVEN, ODD, X, SOL, Position, N1) :-
	Evenness is mod(Position,2),
	% w zaleznosci od parzystości wez element K z L, daj jedno K do X a drugie do odpowiedniego pojemnika
	% (jeśli damy K na parzystym miejscu, to kolejne K powinno być na nieparzystym)
	( ( Evenness is 0, select(K, L, NEW_L), append(ODD, [K], NEW_ODD), NEW_EVEN = EVEN, append(X, [K], X1) )
	; ( Evenness is 1, select(K, L, NEW_L), append(EVEN, [K], NEW_EVEN), NEW_ODD = ODD, append(X, [K], X1) )
	% w zaleznosci od pozycji wez z pojemnika EVEN lub ODD i wstaw do X
	; ( Evenness is 0, select(K, EVEN, NEW_EVEN), NEW_ODD = ODD, NEW_L = L, append(X, [K], X1) )
	; ( Evenness is 1, select(K, ODD, NEW_ODD), NEW_EVEN = EVEN, NEW_L = L, append(X, [K], X1) )),
	
	uwaga0(X1, K),
	Position1 is Position + 1,
	lista(NEW_L, NEW_EVEN, NEW_ODD, X1, SOL, Position1, N1).

