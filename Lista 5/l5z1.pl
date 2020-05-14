%open('ex1.prog', read, X), scanner(X, Y), close(X), write(Y).

is_separator(';').
is_separator('+').
is_separator('-').
is_separator('*').
is_separator('/').
is_separator('(').
is_separator(')').
is_separator('<').
is_separator('>').
is_separator(':').
is_separator('=').

blank(' ').
blank('\n').
blank('\t').

scanner(X, SOL) :-
	scanner2(X, TMP),
	list_scanner(TMP, SOL).

scanner2(X, SOL) :-
	scanner2(X, [], SOL).

scanner2(X, SOL, SOL) :- at_end_of_stream(X), !.

scanner2(X, L, SOL) :-
	get_char(X, Y),
	((\+ blank(Y)) -> append(L, [Y], L2); L2 = L),
	scanner2(X, L2, SOL).

list_scanner(L, SOL) :-
	list_scanner(L, [], SOL).
list_scanner([], SOL, SOL).
list_scanner(X, L, SOL) :-
	head(X, H),
	(is_upper(H) -> read_ID(X, S, L2), append(L, [id(S)], SOL2); 
		(head(X, H), is_separator(H) -> read_sep(X, S, L2), append(L, [sep(S)], SOL2); 
			(head(X, H), is_lower(H) -> read_key(X, S, L2), append(L, [key(S)], SOL2); 
				(head(X, H), is_number(H) -> read_number(X, S, L2), append(L, [int(S)], SOL2))))),
	list_scanner(L2, SOL2, SOL).

read_ID(L, SOL, NEW_L):-
	read_ID(L, '', SOL, L, NEW_L).
read_ID(end, SOL, SOL, NEW_L, NEW_L).
read_ID([H|T], TOKEN, SOL, [H|T], NEW_L2) :-
	 is_upper(H) -> atom_concat(TOKEN, H, NEW_TOKEN), read_ID(T, NEW_TOKEN, SOL, T, NEW_L2);
		read_ID(end, TOKEN, SOL, [H|T], NEW_L2).

read_sep(L, SOL, NEW_L):-
	read_sep(L, '', SOL, L, NEW_L).
read_sep([], SOL, SOL, NEW_L, NEW_L).
read_sep(end, SOL, SOL, NEW_L, NEW_L).
read_sep([H|T], TOKEN, SOL, [H|T], NEW_L2) :-
	 is_separator(H) -> atom_concat(TOKEN, H, NEW_TOKEN), read_sep(T, NEW_TOKEN, SOL, T, NEW_L2);
		read_sep(end, TOKEN, SOL, [H|T], NEW_L2).

read_key(L, SOL, NEW_L):-
	read_key(L, '', SOL, L, NEW_L).
read_key(end, SOL, SOL, NEW_L, NEW_L).
read_key([H|T], TOKEN, SOL, [H|T], NEW_L2) :-
	 is_lower(H) -> atom_concat(TOKEN, H, NEW_TOKEN), read_key(T, NEW_TOKEN, SOL, T, NEW_L2);
		read_key(end, TOKEN, SOL, [H|T], NEW_L2).

read_number(L, SOL, NEW_L):-
	read_number(L, '', SOL, L, NEW_L).
read_number(end, SOL, SOL, NEW_L, NEW_L).
read_number([H|T], TOKEN, SOL, [H|T], NEW_L2) :-
	 is_number(H) -> atom_concat(TOKEN, H, NEW_TOKEN), read_number(T, NEW_TOKEN, SOL, T, NEW_L2);
		read_number(end, TOKEN, SOL, [H|T], NEW_L2).


is_upper(X):-
	char_type(X, upper).

is_lower(X):-
	char_type(X, lower).

is_number(X) :-
	char_type(X, digit).

head([H|_], H).


