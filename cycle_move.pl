:- use_module(library(clpfd)).

move(L,[H|T]):-	append(T,[H],L).
 
execute(L,A) :-	move(L,A).
execute(L,A) :-	move(L,L1), 
				execute(L1,A).

cycle_move(L, 0, L).
cycle_move(L, K, R) :-	K #> 0,
						K1 #= K - 1,
						cycle_move(L, K1, R1),
						execute(R1, R);
						K #< 0,
						K1 #= K + 1,
						cycle_move(L, K1, R1),
						execute(R, R1).