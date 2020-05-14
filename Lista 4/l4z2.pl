osoby(0, []) :- !.
osoby(N, [(_,_,_,_,_)|T]) :- N1 is N-1, osoby(N1,T).
osoby(1, [H|_], H) :- !.
osoby(N, [_|T], R) :- N1 is N-1, osoby(N1, T, R).

ograniczenie1([(norweg,_,_, _, _)|_]).

ograniczenie2([(anglik, czerwony, _, _, _)|_]). 
ograniczenie2([_|T]) :- ograniczenie2(T).

ograniczenie3([(_, zielony, _, _, _), (_, bialy, _, _, _)|_]). 
ograniczenie3([_|T]) :- ograniczenie3(T).

ograniczenie4([(dunczyk, _, herbata, _, _)|_]). 
ograniczenie4([_|T]) :- ograniczenie4(T).

ograniczenie5([(_, _, _, light, _), (_, _, _, _, koty)|_]). 
ograniczenie5([(_, _, _, _, koty), (_, _, _, light, _)|_]). 
ograniczenie5([_|T]) :- ograniczenie5(T).

ograniczenie6([(_, zolty, _, cygaro, _)|_]). 
ograniczenie6([_|T]) :- ograniczenie6(T).

ograniczenie7([(niemiec, _, _, fajka, _)|_]). 
ograniczenie7([_|T]) :- ograniczenie7(T).

ograniczenie8([_,_,(_, _, mleko, _, _),_,_]). 

ograniczenie9([(_, _, _, light, _), (_, _, woda, _, _)|_]). 
ograniczenie9([(_, _, woda, _, _), (_, _, _, light, _)|_]). 
ograniczenie9([_|T]) :- ograniczenie9(T).

ograniczenie10([(_, _, _, bez_filtra, ptaki)|_]). 
ograniczenie10([_|T]) :- ograniczenie10(T).

ograniczenie11([(szwed, _, _, _, psy)|_]). 
ograniczenie11([_|T]) :- ograniczenie11(T).

ograniczenie12([(norweg, _, _, _, _), (_, niebieski, _, _, _)|_]). 
ograniczenie12([(_, niebieski, _, _, _), (norweg, _, _, _, _)|_]). 
ograniczenie12([_|T]) :- ograniczenie12(T).

ograniczenie13([(_, zolty, _, _, _), (_, _, _, _, konie)|_]). 
ograniczenie13([(_, _, _, _, konie), (_, zolty, _, _, _)|_]). 
ograniczenie13([_|T]) :- ograniczenie13(T).

ograniczenie14([(_, _, piwo, mentolowe, _)|_]). 
ograniczenie14([_|T]) :- ograniczenie14(T).

ograniczenie15([(_, zielony, kawa, _, _)|_]). 
ograniczenie15([_|T]) :- ograniczenie15(T).

% istnieje taki co ma rybki
ograniczenie16([(_, _, _, _, rybki)|_]). 
ograniczenie16([_|T]) :- ograniczenie16(T).

domki(L) :-
	osoby(5, L),
	ograniczenie1(L),
	ograniczenie2(L),
	ograniczenie3(L),
	ograniczenie4(L),
	ograniczenie5(L),
	ograniczenie6(L),
	ograniczenie7(L),
	ograniczenie8(L),
	ograniczenie9(L),
	ograniczenie10(L),
	ograniczenie11(L),
	ograniczenie12(L),
	ograniczenie13(L),
	ograniczenie14(L),
	ograniczenie15(L),
	ograniczenie16(L).

rybki(Kto) :-
	domki(L),
	rybki(Kto, L).

rybki(Kto, [A|_]):-
	A = (Kto, _,_,_, rybki).
rybki(Kto, [_|T]) :- rybki(Kto, T).

