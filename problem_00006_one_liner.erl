-module(problem_00006_one_liner).
-export([solve/0]).
solve() ->
	trunc(math:pow(float(lists:sum(lists:seq(1,100))), 2.0)) - lists:sum(lists:map(fun(N) -> trunc(math:pow(float(N), 2.0)) end, lists:seq(1,100))).