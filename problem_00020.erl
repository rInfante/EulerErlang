-module(problem_00020).

-export([solve/0, solve/1]).

solve()->solve(10).
solve(N)->
	lists:sum(int_to_digits(factorial(N))).
	
factorial(N)->
	lists:foldl(fun(X, Prod)->X*Prod end, 1, lists:seq(1,N)).

int_to_digits(N)->
	lists:map(fun(C) -> C - 48 end, integer_to_list(N)).
	