-module(problem_00003_d_short).

-export([solve/0]).

solve() ->
	factorise(600851475143, 2, []).
	
factorise(1, _D, Factors) -> Factors;
factorise(N, D, Factors) ->
	case (N rem D  == 0) of
		true -> factorise(N div D, D, [{D, N div D}|Factors]);
		false -> factorise(N, D + 1, Factors)
	end.