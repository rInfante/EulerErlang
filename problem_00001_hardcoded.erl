-module(problem_00001_hardcoded).
-export([solve/0]).
solve()->
	lists:sum(lists:filter(fun(X)-> (X rem 3 == 0) or (X rem 5 == 0) end,  lists:seq(1, 999))).
