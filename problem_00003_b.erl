
-module(problem_00003_b).

-export([prime_divisors/1]).

%%DEBUG
-export([divisors/1, is_prime/1]).

divisors(N) ->
	Previous = lists:seq(2, N-1),
	lists:filter(fun(P)-> N rem P == 0 end, Previous).
	
is_prime(N) ->
	if 
		N =<3 ->
			N >= 2;
		(N rem 2 == 0) or (N rem 3 == 0) ->
			false;
		true ->
			PotentialDivisors = lists:seq(5,trunc(math:sqrt(N)),6),
			case lists:any(fun(P)->(N rem P == 0) or (N rem (P+2) == 0) end, PotentialDivisors) of
				true -> false;
				false -> true			
			end
	end.
	
prime_divisors(N) ->
	Divisors = divisors(N),
	lists:filter(fun(D) -> is_prime(D) end, Divisors).
	

	