-module(problem_00003).

-export([largest_prime_factor/1]).
%%DEBUG
-export([get_primes/1, get_primes/3]).

largest_prime_factor(N) ->
	PotentialPrimeFactors = get_primes(round(N/2)),
	%DEBUG:io:format("N: ~w; Potential Prime Factors: ~w~n",[N, PotentialPrimeFactors]),
	PrimeFactors = lists:filter(fun(P) -> N rem P == 0 end, PotentialPrimeFactors),
	io:format("Prime Factors: ~w~n",[PrimeFactors]),
	lists:max(PrimeFactors).
		
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
	%DEBUG:io:format("UpperLimit: ~w; N: ~w; PreviousPrimes: ~w; NewPreviousPrimes: ~w~n", [UpperLimit, N, PreviousPrimes,NewPreviousPrimes]),
	get_primes(UpperLimit, N+1, NewPreviousPrimes).
	
			