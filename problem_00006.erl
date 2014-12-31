-module(problem_00006).

-export([solve/0]).

solve() ->
	Numbers = lists:seq(1,100),
	square_of_sum(Numbers) - sum_of_squares(Numbers).
	
sum_of_squares(Numbers) ->
	Squares = lists:map(fun(N) -> trunc(math:pow(float(N), 2.0)) end, Numbers),
	lists:sum(Squares).
	
square_of_sum(Numbers) ->
	Sum = lists:sum(Numbers),
	trunc(math:pow(float(Sum), 2.0)).