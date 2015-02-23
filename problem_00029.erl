-module(problem_00029).

-export([solve/0]).
	
solve()->a_pow_b(2, 100).
	
a_pow_b(Min, Max) ->
	Powers = [math:pow(A,B) ||
		A <- lists:seq(Min, Max),
		B <- lists:seq(Min, Max)],
	length(distinct(Powers)).
	
distinct(L)->
	sets:to_list(sets:from_list(L)).