-module(problem_00021).

-export([solve/0]).
-export([proper_divisors/1]).

%% THIS SOLUTION WORKS BUT IS A BIT SLOW

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
	
proper_divisors(N) ->
	lists:filter(fun(X)->N rem X == 0 end, lists:seq(1, N-1)).
d(N) -> 
	lists:sum(proper_divisors(N)).

