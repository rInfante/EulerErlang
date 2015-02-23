-module(problem_00019).
-export([solve/0]).
-export([month/2,leap/1]).

solve()->solve(1, 1901, 12, 2000, 2).
solve(M1,Y1, M2, Y2, StartDay)->
	calc_number_sundays(M1,Y1, M2, Y2, StartDay, 0).
	
month(1,_Y)->31;
month(2,Y)->28+leap(Y);
month(3,_Y)->31;
month(4,_Y)->30;
month(5,_Y)->31;
month(6,_Y)->30;
month(7,_Y)->31;
month(8,_Y)->31;
month(9,_Y)->30;
month(10,_Y)->31;
month(11,_Y)->30;
month(12,_Y)->31.
leap(Y)->
	case (Y rem 4 == 0) and ((Y rem 100 /= 0) or (Y rem 400 == 0)) of
		true->1;
		false->0
	end.
	
calc_number_sundays(M1,Y1, M2, Y2, CumDays, NumberSundays)->
	IsSunday = 
		case (CumDays rem 7 == 0) of 
			true->1;
			false->0
		end,
	NewNumberSundays = NumberSundays + IsSunday,
	case (M1==M2) and (Y1==Y2) of
		true->NewNumberSundays;
		false->
			{NewM1, NewY1} = 
				case (M1 == 12) of
					true ->{1, Y1+1};
					false ->{M1+1, Y1}
				end,
			%io:format("Month:~w; year:~w; CumDays:~w; NumberSundays:~w~n", [M1,Y1, CumDays,NewNumberSundays]),
			calc_number_sundays(NewM1, NewY1, M2, Y2, CumDays+month(M1,Y1), NewNumberSundays)			
	end.