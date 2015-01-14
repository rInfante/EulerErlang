-module(problem_00027).
-export([solve/0, solve/2, init/0]).
-export([specific_quadratic/2, is_prime/1]).

init() ->
	{ok, _} = dets:open_file(primes, []).

solve()->solve(100000, 150).
solve(PrimesLimit, SeqMaxLength)->
	%%init(),	
	Primes = sets:from_list(lists:filter(fun(X)->is_prime(X) end, lists:seq(1,PrimesLimit))),
	%%dets:insert_new(primes, {1, Primes}),
	CoefficientCombinations = [ {A, B} || 
									A <- lists:seq(-1000, 1000),
									B <- lists:seq(-1000, 1000) ],
	ValidCoefficientCombinations = lists:filter(fun({_A,B})->sets:is_element(B, Primes) end, CoefficientCombinations),
	QuadraticSequences = lists:map(fun({A,B})-> quadratic_prime_sequence_length({A, B}, Primes, SeqMaxLength) end, ValidCoefficientCombinations),
	MaxSequenceLength = lists:max(lists:map(fun({_A,_B,Len})->Len end, QuadraticSequences)),
	MaxSequenceItem = lists:filter(fun({_A,_B,Len})->Len ==  MaxSequenceLength end, QuadraticSequences),
	MaxSequenceItem.
	
quadratic_prime_sequence_length({A, B}, Primes, SeqMaxLength) ->
	Quadratic = specific_quadratic(A, B),
	QuadraticSequence = lists:map(fun(X)->Quadratic(X) end, lists:seq(0,SeqMaxLength)),
	io:format("{A=~w, B=~w} Max =~w Length:~w~n", [A,B,lists:max(QuadraticSequence), length(QuadraticSequence)]),
	ConsecutivePrimes = lists:takewhile(fun(X)-> sets:is_element(X, Primes) end, QuadraticSequence),
	io:format("{A=~w, B=~w} ConsecutivePrimes =~w~n", [A,B,ConsecutivePrimes]),
	{A, B, length(ConsecutivePrimes)}.

specific_quadratic(A, B) ->
	fun(N) -> N*N + A*N + B end.
	
%FROM PROBLEM 10
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