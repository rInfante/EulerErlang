-module(problem_00004_b_one_liner).

-export([solve/0]).

solve() ->
	lists:max(lists:map(fun(P)->list_to_integer(P) end, lists:filter(fun(S) -> S == lists:reverse(S) end, lists:map(fun(P) -> integer_to_list(P) end, [X*Y || X <- lists:seq(100,999), Y <- lists:seq(100,999)])))).