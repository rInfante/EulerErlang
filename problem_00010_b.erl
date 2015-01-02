-module(problem_00010_b).

-export([solve/0]).

%%THIS SOLUTION WORKS BUT IS NOT SUITABLE TO A RECURSIVE ALGORITHM
solve()->
	Sieve=[{1,false}|lists:map(fun(I)->{I,true} end, lists:seq(2,1000000))],
	find_primes(Sieve, 2).
	
find_primes(Sieve, Pos) ->	
	io:format("pos:~w",[Pos]),
	case Pos == length(Sieve) of
		true -> Sieve;
		false -> 
			{_, PosFlag} = lists:nth(Pos, Sieve),
			case (PosFlag) of
				false -> find_primes(Sieve, Pos+1);
				true -> 
					NewSieve = lists:map(fun({I,Flag})->
												if 
													(I == Pos) -> {I, Flag};
													(I rem Pos == 0) -> {I, false};
													true -> {I, Flag}
												end 
										 end, Sieve),
					%%io:format("Pos:~w;NewSieve:~w~n", [Pos, NewSieve]),
					find_primes(NewSieve, Pos+1)
			end											
	end.

