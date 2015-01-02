-module(problem_00003_d).

-export([solve/0]).

solve() ->
	factorise(600851475143).
	
factorise(N) ->
	factorise(N, 2, []).
	
factorise(1, _Divisor, Factors) ->
	Factors;
factorise(N, Divisor, Factors) ->
	case (N rem Divisor  == 0) of
		true -> factorise(N div Divisor, Divisor, [{Divisor, N div Divisor}|Factors]);
		false -> factorise(N, Divisor + 1, Factors)
	end.	