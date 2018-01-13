:- use_module(library(clpfd)).
conjugate([Re, Im], [Re, Im_n]) :- Im_n #= Im * (-1).

get_column(_ColumnNumber, [], []):-!.
get_column(ColumnNumber, [Row|Tail], [ElementConj|TailColumn]):-
  nth0(ColumnNumber, Row, Element), conjugate(Element, ElementConj),
  get_column(ColumnNumber, Tail, TailColumn).

checkMatrixRowElements([]).
checkMatrixRowElements([H|T]) :- length(H, N),
								 N = 2,
								 checkMatrixRowElements(T).
checkMatrix([]).
checkMatrix([H|T]) :- checkMatrix(T),
					  checkMatrixRowElements(H).


transposition(Matrix, TransposeMatrix):-
  checkMatrix(Matrix),
  transposition(0, Matrix, TransposeMatrix).
 
transposition(Iterator, Matrix, [Column|TransposeTail]):-
  TailIterator #= Iterator + 1,
  get_column(Iterator, Matrix, Column), !,
  transposition(TailIterator, Matrix, TransposeTail).
transposition(_Iterator, _Matrix, []).
