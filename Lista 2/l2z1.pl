srodkowy([X], X).
srodkowy(A, X) :-
	[_|K] = A,
	reverse(K, B),
	[_|C] = B,
	srodkowy(C, X).


