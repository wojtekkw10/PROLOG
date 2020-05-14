on(x2, x1).
on(x3, x2).
on(x4, x3).
on(x5, x4).
on(x6, x5).
on(x7, x6).

above(A, B) :- on(A, B).
above(A, B) :-
    on(A, Z), above(Z, B).


