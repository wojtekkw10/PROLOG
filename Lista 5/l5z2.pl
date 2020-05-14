board(L) :-
	recalculate_list(L, NEW_L),
	length(NEW_L, LENGTH),
	STARTING_COLOR_SHIFT is LENGTH mod 2,
	board(NEW_L, LENGTH, STARTING_COLOR_SHIFT).
board([], LENGTH, _) :- draw_edge(LENGTH).
board([H|T], LENGTH, COLOR_SHIFT) :-
	draw_row(COLOR_SHIFT, H, LENGTH),
	NEW_COLOR_SHIFT is (COLOR_SHIFT + 1) mod 2,
	board(T, LENGTH, NEW_COLOR_SHIFT).



draw_row(COLOR_SHIFT, HETMAN_POS, LENGTH) :-
	draw_edge(LENGTH),
	draw_inner(COLOR_SHIFT, LENGTH, HETMAN_POS).

draw_edge(LENGTH) :-
	draw_edge(0, LENGTH).

draw_edge(LENGTH, LENGTH) :- write("+\n"), !.
draw_edge(CURR, LENGTH) :-
	write("+-----"),
	CURR1 is CURR + 1,
	draw_edge(CURR1, LENGTH).

draw_inner(COLOR_SHIFT, LENGTH, HETMAN_POS) :-
	NEW_HETMAN_POS is HETMAN_POS - 1,
	draw_inner(COLOR_SHIFT, LENGTH, NEW_HETMAN_POS, 0),
	draw_inner(COLOR_SHIFT, LENGTH, NEW_HETMAN_POS, 0).
draw_inner(_, LENGTH, _, LENGTH) :- write("|\n"), !.
draw_inner(COLOR_SHIFT, LENGTH, HETMAN_POS, CURR) :-
	COLOR is (CURR + COLOR_SHIFT) mod 2,
	(CURR == HETMAN_POS -> draw_hetman(COLOR);
	(COLOR == 0 -> write("|     "); write("|:::::"))),
	CURR1 is CURR + 1,
	draw_inner(COLOR_SHIFT, LENGTH, HETMAN_POS, CURR1).

draw_hetman(COLOR_SHIFT) :-
	(COLOR_SHIFT == 0 -> write("| ### "); write("|:###:")).

recalculate_list(L, RES) :-
	length(L, LENGTH),
	recalculate_list(L, [], 0, LENGTH, RES).
recalculate_list(_, RES, LENGTH, LENGTH, RES).
recalculate_list(L, CURR_LIST, CURR_INDEX, LENGTH, RES) :-
	I is LENGTH - CURR_INDEX,
	indexOf(L, I, INDEX),
	FIX_INDEX is INDEX + 1,
	append(CURR_LIST, [FIX_INDEX], NEW_CURR_LIST),
	CURR_INDEX1 is CURR_INDEX + 1,
	recalculate_list(L, NEW_CURR_LIST, CURR_INDEX1, LENGTH, RES).

indexOf([Element|_], Element, 0):- !.
indexOf([_|Tail], Element, Index):-
  indexOf(Tail, Element, Index1),
  !,
  Index is Index1+1.

%-----------------------------------------------------------------------
	

dobra(X) :-
	\+ zla(X).
zla(X) :-
	append(_, [Wi | L1], X),
	append(L2, [Wj | _], L1),
	length(L2, K),
	abs(Wi - Wj) =:= K + 1.
hetmany(N, P) :-
	numlist(1, N, L), % stworzenie listy liczb 1 .. N
	permutation(L, P),
	dobra(P).
