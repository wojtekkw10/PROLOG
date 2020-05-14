mezczyzna(adam).
mezczyzna(piotr).
kobieta(ewa).
kobieta(ania).
kobieta(kasia).

ojciec(piotr, adam).
ojciec(adam, ewa).
matka(ania, ewa).
matka(ania, kasia).

rodzic(X, Y) :-
    matka(X, Y);
    ojciec(X, Y).


jest_matka(X) :-
    matka(X, _).
jest_ojcem(X) :-
    ojciec(X, _).
jest_synem(X) :-
    mezczyzna(X), rodzic(_, X).
siostra(X, Y) :-
    kobieta(X), rodzic(Z, X), rodzic(Z, Y), X\=Y.
dziadek(X, Y) :-
    mezczyzna(X), rodzic(X, Z), rodzic(Z, Y).
rodzeństwo(X, Y) :-
    rodzic(Z, X), rodzic(Z, Y), X\=Y.


