-module(problem_00030).

-export([solve/0]).

solve()->
	lists:sum(lists:filter(fun(N)->digits_power_sum(N, 5) == N end, lists:seq(2, 500000))).

digits_power_sum(N, P) ->
	lists:sum(lists:map(fun(D) -> math:pow(D, P) end, to_digits(N))).
to_digits(N) ->
	lists:map(fun(C) -> C - 48 end, integer_to_list(N)).