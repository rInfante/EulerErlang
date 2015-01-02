-module(problem_00010_c_2).

-export([solve/0]).

%%THIS DOESN NOT WORK
solve()->
	lists:sum(lists:filter(fun(N)->is_prime(N) end, lists:seq(3,100))).
	
is_prime(N) -> ((N == 2) or (N rem 2 == 1)) and lists:all(fun(X)-> (N rem X /=0) end, lists:seq(3,trunc(math:sqrt(N)))).