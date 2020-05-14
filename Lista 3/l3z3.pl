% zlicza ilość swapów od pewnego miejsca permutacji w prawo
curr_swaps(L, K, X) :-
	curr_swaps(L, K, 0, X).
curr_swaps([], _, X, X).
curr_swaps([A|B], K, ACC, X) :-
	(A < K -> ACC1 is ACC + 1;
	ACC1 = ACC),
	curr_swaps(B, K, ACC1, X).

% zlicza ilość wszystkich swapów w permutacji
% zwraca true, gdy ilość swapów podzielna przez 2
is_even(L) :-
	is_even(L, 0).

is_even([], SWAPS) :- 0 is mod(SWAPS, 2). 

is_even([A|B], SWAPS) :-
	curr_swaps(B, A, X),
	SWAPS1 is X + SWAPS,
	is_even(B, SWAPS1).

% generuje permutacje
perm([], []).
perm(L1, [X | L3]) :-
	select(X, L1, L2),
	perm(L2, L3).


even_permutation(Xs, Ys) :-
	perm(Xs, Ys), is_even(Ys).

odd_permutation(Xs, Ys) :-
	perm(Xs, Ys), not(is_even(Ys)).

