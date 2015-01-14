-module(problem_00015_c).

-export([solve/0]).
-export([solve/1, pascal_triangle/1, pascal_triangle/3, unfold_two_items_sum/1, unfold_two_items_sum/3]).

solve()->solve(20).
solve(N)->
	PascalTriangle = pascal_triangle(N),
	lists:nth((length(PascalTriangle) div 2) + 1, PascalTriangle).

pascal_triangle(N) ->
	pascal_triangle(N, 1, [1])	.
pascal_triangle(N, C, L) ->
	case C == N * 2 + 1 of
		true -> L;
		false -> pascal_triangle(N, C+1, unfold_two_items_sum(L))
	end.

unfold_two_items_sum(L) ->
	unfold_two_items_sum(L, 1, [1]).
unfold_two_items_sum(L, Pos, NewL)->
	case Pos == length(L) of
		true ->	lists:flatten([NewL | [1]]);
		false -> unfold_two_items_sum(L, Pos+1, [NewL | [lists:sum(lists:sublist(L, Pos,2))]])			
	end.
	

	