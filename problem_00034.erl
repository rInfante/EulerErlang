-module(problem_00034).

-export([solve/0]).

solve()->
	lists:sum(lists:filter(fun(N)-> (N > 9) and is_curious_number(N) end, lists:seq(3, 100000))).

is_curious_number(N) ->
	lists:sum(lists:map(fun(D) -> digit_factorial(D) end, to_digits(N))) == N.
	
to_digits(N) ->
	lists:map(fun(C) -> C - 48 end, integer_to_list(N)).	
	
digit_factorial(0) -> 1;
digit_factorial(1) -> 1;
digit_factorial(2) -> 2;
digit_factorial(3) -> 3;
digit_factorial(4) -> 24;
digit_factorial(5) -> 120;
digit_factorial(6) -> 720;
digit_factorial(7) -> 5040;
digit_factorial(8) -> 40320;
digit_factorial(9) -> 362880;
digit_factorial(_) -> 0.

	
	