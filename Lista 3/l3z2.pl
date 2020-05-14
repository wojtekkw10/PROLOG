max_sum(L, X) :-
	max_sum(L, 0, 0, X).

max_sum([], MAX, _, MAX). 

% dodaje kolejne elementy, dopóki suma większa od zera
% gdy suma < 0, suma = 0 i kontynuuje zliczanie
max_sum([A|B], MAX, CURR, X) :-
	CURR1 is CURR + A,
	(CURR1 > MAX -> 
			MAX1 = CURR1, CURR2 = CURR1; 
			( CURR1 =< 0 -> 
					CURR2 = 0, MAX1 = MAX;
					CURR2 is CURR1, MAX1 = MAX)),
	max_sum(B, MAX1, CURR2, X).
