-module(problem_00010).

-export([solve/0]).
%%DEBUG
-export([get_primes/1, get_primes/3]).

solve()->
	lists:sum(get_primes(2000000)).

%%CODE BELOW SAME AS FOR PROBLEM 3	
get_primes(UpperLimit) when UpperLimit > 1 ->
	get_primes(UpperLimit, 2, []);
get_primes(_) -> [].

get_primes(UpperLimit, N, PreviousPrimes) when N > UpperLimit ->
	PreviousPrimes;
get_primes(UpperLimit, N, PreviousPrimes) ->
	NewPreviousPrimes = case lists:any(fun(P)-> N rem P == 0 end, PreviousPrimes) of
		true -> PreviousPrimes;			
		false -> [N | PreviousPrimes]
	end,
	%%DEBUG io:format("UpperLimit: ~w; N: ~w; PreviousPrimes: ~w; NewPreviousPrimes: ~w~n", [UpperLimit, N, PreviousPrimes,NewPreviousPrimes]),
	io:format("UpperLimit: ~w; N: ~w~n ", [UpperLimit, N]),
	get_primes(UpperLimit, N+1, NewPreviousPrimes).