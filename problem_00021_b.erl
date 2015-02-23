-module(problem_00021_b).

-export([solve/0]).
-export([proper_divisors/1]).


solve()->solve(10000).
solve(N)->
	DivisorsSumDict = dict:from_list(lists:map(fun(X)-> {X, d(X)} end, lists:seq(1, 3*N))),
	AmicableNumbers = lists:filter(
		fun(X)->			
			DivisorsSum = dict:fetch(X,DivisorsSumDict),
			io:format("DivisorsSum of ~w is ~w~n",[X,DivisorsSum]),
			(DivisorsSum /= 0) and (DivisorsSum /= X) and (dict:is_key(DivisorsSum, DivisorsSumDict)) and (dict:fetch(DivisorsSum, DivisorsSumDict) == X)
		end, 
		lists:seq(2, N)),
	lists:sum(AmicableNumbers).
	
%%This makes it much faster!!!	
proper_divisors(N) ->
	Core=lists:filter(fun(X)->N rem X == 0 end, lists:seq(1, trunc(math:sqrt(N))+1)),
	Derived=lists:map(fun(X)->N div X end, lists:delete(1,Core)),
	lists:merge(Core, Derived).
	
d(N) -> 
	lists:sum(proper_divisors(N)).

