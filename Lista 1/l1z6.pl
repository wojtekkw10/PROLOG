prime(LO, HI, N) :-
    between(LO, HI, N),
    \+ ( K is round(sqrt(N)), between(2, K, Y), 0 is mod(N, Y)  ).
