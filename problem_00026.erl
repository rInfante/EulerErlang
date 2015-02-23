-module(problem_00026).
-export([solve/0, solve/2, digits/3]).

solve()->solve(1, 1000).
solve(D1,D2)->
	DigitsRange=lists:map(fun(X)->{X, digits(X,1,[])} end, lists:seq(D1,D2)),
	ValidDigitsRange = lists:map(fun({X1,Digits1})->{X1, lists:filter(fun(D)-> D/=0 end, Digits1)} end, lists:filter(fun({_X,Digits})->lists:last(Digits) /= 0 end, DigitsRange)),
	lists:filter(fun({_X,Digits})->length(Digits)>7 end, ValidDigitsRange).
	
%%THIS IS NOT WORKING WELL
digits(D, Num, Decimals)->
	case (Num rem D) == 0 of
		true->Decimals ++ [Num div D] ++ [0];
		false->			
			{NewNum, NewDecimal} = 			
				case Num / D > 1 of
					true-> {Num rem D, Num div D};
					false-> {Num * 10,0}
				end,			
			io:format("~w~n", [Decimals ++ [NewDecimal]]),
			%case NewDecimal of
			%	[]-> digits(D, NewNum, Decimals);				
			%	Dec when lists:member(Dec, Decimals) -> Decimals ++ [Dec];
			%	Dec ->	digits(D, NewNum, Decimals ++ [Dec])
			%end
			
			case (NewDecimal /= 0) and lists:member(NewDecimal, Decimals) of
				true -> Decimals ++ [NewDecimal];
				false ->
					case NewDecimal == 0 of
						true-> digits(D, NewNum, Decimals);
						false-> digits(D, NewNum, Decimals ++ [NewDecimal])
					end
			end
	end.
	
