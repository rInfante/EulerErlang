-module(problem_00016).
-export([solve/0, solve/1]).

solve()-> solve(1000).
solve(N)->
	Power = lists:foldl(fun(X, Prod) -> X * Prod end, 1, lists:duplicate(N,2)),
	lists:sum(lists:map(fun(C) -> C - 48 end, integer_to_list(Power))).
