left_of(olowek, klepsydra).
left_of(klepsydra, motyl).
left_of(motyl, ryba).
left_of(A, B) :-
    left_of(Z, B), left_of(A, Z). 

above(rower, olowek).
above(aparat, motyl).
above(A, B) :-
    above(A, Z), above(Z, B).

right_of(A, B) :- left_of(B, A).
below(A, B) :- above(B, A).

higher(A, B):-
	above(A, B);
	above(A, Z), left_of(B, Z);
	above(A, Z), right_of(B, Z).


