-module(problem_00017).

-export([solve/0, solve/1]).
-export([number_letters/1,number_letters/2]).

solve()->solve(1000).
solve(N)->
	NumberLetters = lists:flatten(lists:map(fun(X)->number_letters(X) end, lists:seq(1, N))),
	length(NumberLetters).

number_letters(0)->[""];
number_letters(1)->["one"];
number_letters(2)->["two"];
number_letters(3)->["three"];
number_letters(4)->["four"];
number_letters(5)->["five"];
number_letters(6)->["six"];
number_letters(7)->["seven"];
number_letters(8)->["eight"];
number_letters(9)->["nine"];
number_letters(10)->["ten"];

number_letters(11)->["eleven"];
number_letters(12)->["twelve"];
number_letters(13)->["thirteen"];
number_letters(14)->["fourteen"];
number_letters(15)->["fifteen"];
number_letters(16)->["sixteen"];
number_letters(17)->["seventeen"];
number_letters(18)->["eighteen"];
number_letters(19)->["nineteen"];

number_letters(1000)->["one", "thousand"];

number_letters(N)->
	Digits = lists:map(fun(C) -> C - 48 end, integer_to_list(N)),%converts char to int
	number_letters(Digits, []).
	
number_letters([C,D,U], Letters) ->
	And = 	
		case (D == 0) and (U == 0) of
				true -> "";
				false -> "and"
		end,
	number_letters([D,U], lists:append(Letters,lists:append(number_letters(C), ["hundred", And])));
number_letters([D,U], Letters) ->
	case D of 
		0 -> number_letters([], lists:append(Letters,number_letters(U)));
		1 -> number_letters([], lists:append(Letters,number_letters(10+U)));	
		2 -> number_letters([], lists:append(Letters,lists:append(["twenty"], number_letters(U))));	
		3 -> number_letters([], lists:append(Letters,lists:append(["thirty"], number_letters(U))));	
		4 -> number_letters([], lists:append(Letters,lists:append(["forty"], number_letters(U))));	
		5 -> number_letters([], lists:append(Letters,lists:append(["fifty"], number_letters(U))));	
		6 -> number_letters([], lists:append(Letters,lists:append(["sixty"], number_letters(U))));	
		7 -> number_letters([], lists:append(Letters,lists:append(["seventy"], number_letters(U))));	
		8 -> number_letters([], lists:append(Letters,lists:append(["eighty"], number_letters(U))));	
		9 -> number_letters([], lists:append(Letters,lists:append(["ninety"], number_letters(U))))	
	end;
number_letters([], Letters) -> 
	Letters.
			
			