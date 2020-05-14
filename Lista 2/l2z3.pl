arc(a,b).
arc(b,a).
arc(b,c).
arc(c,d).


osiagalny(X, Y) :-
	osiagalny(X, Y, []).

osiagalny(_, Y, L) :- member(K, L), K = Y.
osiagalny(X, X, _).

osiagalny(X, Y, L) :-
	  arc(X, Z), not(member(Z, L)),  append([X], L, L1),  osiagalny(Z, Y, L1), not(X=Y) .
