-module(problem_00033).

-export([solve/0]).

solve()->
	Domain = [ {M, N} || M <- lists:seq(11, 99), N <- lists:seq(11, 99)],
	LessThanOne = lists:filter(fun({M, N}) -> M / N < 1.0 end, Domain),
	CuriousFractions = lists:filter(fun({M, N}) -> is_curious_fraction(M, N) end, LessThanOne),
	CuriousFractions.

is_curious_fraction(N, D) ->
	NumDigits = array:from_list(to_digits(N)),
	DenDigits = array:from_list(to_digits(D)),
	%io:format("NumDigits: ~w ~w; DenDigits: ~w ~w~n", [array:get(0, NumDigits), array:get(1, NumDigits), array:get(0, DenDigits),array:get(1, DenDigits)]),
	case 	
		( (array:get(0, DenDigits) == 0) or (array:get(1, DenDigits) == 0))
		of
			true -> false;
			false ->
				case
				(				
					not ( (array:get(1, NumDigits) == 0) and (array:get(1, DenDigits) == 0))
					and
						(
							( (array:get(0, NumDigits) == array:get(0, DenDigits) ) and ( array:get(1, NumDigits) / array:get(1, DenDigits) == N/D ) ) or
							( (array:get(0, NumDigits) == array:get(1, DenDigits) ) and ( array:get(1, NumDigits) / array:get(0, DenDigits) == N/D ) ) or
							( (array:get(1, NumDigits) == array:get(0, DenDigits) ) and ( array:get(0, NumDigits) / array:get(1, DenDigits) == N/D ) ) or
							( (array:get(1, NumDigits) == array:get(1, DenDigits) ) and ( array:get(0, NumDigits) / array:get(0, DenDigits) == N/D ) ) 					
						)
				)
					of
						true -> true;
						false -> false
					end
	end.
	
to_digits(N) ->
	lists:map(fun(C) -> C - 48 end, integer_to_list(N)).	