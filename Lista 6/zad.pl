split_at(N,Xs,Take,Rest) :-
    split_at_(Xs,N,Take,Rest).

split_at_(Rest, 0, [], Rest) :- !. % optimization
split_at_([], N, [], []) :-
    % cannot optimize here because (+, -, -, -) would be wrong,
    % which could possibly be a useful generator.
    N > 0.
split_at_([X|Xs], N, [X|Take], Rest) :-
    N > 0,
    succ(N0, N),
    split_at_(Xs, N0, Take, Rest).

%phrase(program(PROGRAM), Y), format('~s~n', [Y])

% program(langyage) --> w co przechodzi
%program([X|Y]) --> instrukcja(X), program(Y); [].
% ten kod działa, zacznij od końcowych wyprowadzen
program(X) --> instrukcja(P2, X), [sep(;)], program(P2); [].
instrukcja(P2, assign(X,Y);P2) --> id(X), [sep(:=)] , id(Y); [].
wyrazenie(X) --> [X].

id(ID) --> [id(ID)].


ala(_) --> [ala].

%rec().
rec(P) --> a(P1, P2, P), rec(P2); [].
a(P1, P2, P1;P2) --> [P1].

rec2([])-->[].
rec2([X|Y]) --> [X], rec2(Y); [].


kod(a) --> `0`.
kod(f(X,Y)) --> `1`, kod(X), kod(Y).


/*
test(A, C) :-
	aa(A, B),
	bb(B, C).

aa([a|A], B) :-
	aa(A, B).

bb([b|A], B) :-
	bb(A, B).
*/
