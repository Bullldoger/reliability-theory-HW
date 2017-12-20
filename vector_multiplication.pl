:- use_module(library(clpfd)).
%Реализация скалярного произведения
%Если входной список пуст, то отсечение
scalar_multiplication(_, [], []) :- !.

%к-ый элемент умножается на K, далее рекурсивно вниз.
scalar_multiplication(K, [H|T], [H1|T1]) :-
									H1 #= H * K, 
									scalar_multiplication(K, T, T1).

%Если входной список пуст, то отсечение
vector_multiplication([], _, []) :- !.
%Элемент H умножается на вектор строку Y и дописывается в новый список, далее рекурсивно вниз
vector_multiplication([H|T], Y, [ANS_H|ANS_T]) :- 
											scalar_multiplication(H, Y, ANS_H), 
											vector_multiplication(T, Y, ANS_T).
