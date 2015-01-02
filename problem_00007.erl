-module(problem_00007).

-export([solve/0]).

solve()->
	get_nth_prime(10001).
	
get_nth_prime(N) ->
	Primes = get_n_primes(N),
	lists:max(Primes).
		
get_n_primes(N) when N > 1 ->
	get_n_primes(N, 2, []);
get_n_primes(_) -> [].

get_n_primes(N, M, PreviousPrimes) ->
	case length(PreviousPrimes) == N of
		true ->
			PreviousPrimes;
		false ->
			NewPreviousPrimes = case lists:any(fun(P)-> M rem P == 0 end, PreviousPrimes) of
				true -> PreviousPrimes;			
				false -> [M | PreviousPrimes]
			end,
			%%DEBUG io:format("N: ~w; M: ~w; PreviousPrimes: ~w; NewPreviousPrimes: ~w~n", [N, M, PreviousPrimes,NewPreviousPrimes]),
			io:format("N: ~w; M: ~w; Num primes:~w~n", [N, M, length(NewPreviousPrimes)]),
			get_n_primes(N, M+1, NewPreviousPrimes)
	end.