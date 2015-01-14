-module(problem_00012_b_3).

-export([init/0,solve/0]).
-export([number_of_divisors/1]).
%THIS HAS GIVEN THE SOLUTION IN ACCEPTABLE TIME:
%*Memoization of triangle numbers
%*Seeding of prime numbers (from problem 10)
%*Factorization of triangle numbers (from problem 5)
init() ->
    {ok, _} = dets:open_file(triangle_numbers, []),
	{ok, _} = dets:open_file(divisors, []), 
	{ok, _} = dets:open_file(primes, []).

solve()->
	init(),	
	PrimeFactors = lists:filter(fun(X)->is_prime(X) end, lists:seq(1,100)),%%FROM PRB 10
	dets:insert_new(primes, {1, PrimeFactors}),
	find_triangle_numbers_with_over_n_divisors(2, 500).
	
find_triangle_numbers_with_over_n_divisors(N, ND)->
	TriangleNumber = triangle_number(N),	
	NumberOfDivisors = number_of_divisors(TriangleNumber),
	case NumberOfDivisors > ND of
		true -> TriangleNumber;
		false -> 
			io:format("T:~w; NumberOfDivisors:~w~n", [TriangleNumber, NumberOfDivisors]),
			find_triangle_numbers_with_over_n_divisors(N+1, ND)
	end.
		
triangle_number(1) -> 1;
triangle_number(N) ->
	memoize(fun(X)->triangle_number(X-1) + X end, N, triangle_numbers).

	
memoize(F,N,StoreName) ->
    case dets:lookup(StoreName, N) of
      [] ->
        Result = F(N), 
        dets:insert_new(StoreName, {N, Result}),
        Result;
      [{N, Cached}] ->
        Cached
    end.	
		
%FROM PRB 10_C		
is_prime(N) ->
	if 
		N =<3 -> N >= 2;
		(N rem 2 == 0) or (N rem 3 == 0) -> false;
		true ->
			case lists:any(fun(P)->(N rem P == 0) or (N rem (P+2) == 0) end, lists:seq(5,trunc(math:sqrt(N)),6)) of
				true -> false;
				false -> true			
			end
	end.	

%FROM PRB 5	
factor_decompose(N, M, T) ->
	case(N rem trunc(math:pow(M, T))) == 0 of
		true ->
			factor_decompose(N, M, T+1);
		false ->
			{M, T-1}
	end.

%FROM PRB 5		
factor_decomposition(N,PrimeFactors) ->
	FactorsWithExponent = lists:map(fun(P) -> factor_decompose(N, P, 1) end, PrimeFactors),
	lists:filter(fun({_,T}) -> T /= 0 end, FactorsWithExponent).	
	
number_of_divisors(N)->
	[{M, PrimeFactors}] = dets:lookup(primes, 1), 	
	FactorDecomposition = factor_decomposition(N, PrimeFactors),
	trunc(lists:foldl(fun({_F, Exp}, Acc) -> Acc*(Exp+1) end, 1.0, FactorDecomposition)).
	%%USED THIS: http://mathschallenge.net/library/number/number_of_divisors