-module(problem_00028).

-export([solve/0]).

solve()->
	1 + lists:sum(lists:map(fun(Size)-> spiral_level_sum(Size) end, lists:seq(3, 1001, 2))).

spiral_level_sum(Size)->
	%%Square = Size*Size, SizeMinusOne = Size-1,
	%%Square + (Square - SizeMinusOne) + (Square - 2*SizeMinusOne) + (Square - 3*SizeMinusOne).
	%%which simplifies to:
	4*Size*Size - 6*(Size-1).