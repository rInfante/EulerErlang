-module(problem_00012_c).
% MUCH FASTER AND COMPACT SOLUTION AFTER VIEWING PROBLEM THREAD
-export([solve/0]).

solve()->
	find_triangle_numbers_with_over_n_divisors(2, 500).
	
find_triangle_numbers_with_over_n_divisors(N, ND)->
	TriangleNumber = triangle_number(N),	
	NumberOfDivisors = number_of_divisors(TriangleNumber),
	case NumberOfDivisors > ND of
		true -> TriangleNumber;
		false -> 
			%io:format("N:~w; T:~w; NumberOfDivisors:~w~n", [N, TriangleNumber, NumberOfDivisors]),
			find_triangle_numbers_with_over_n_divisors(N+1, ND)
	end.
	
triangle_number(N) -> trunc(N*(N+1)/2).
number_of_divisors(N) ->	
	2*length(lists:filter(fun(X)->N rem X == 0 end, lists:seq(1, trunc(math:sqrt(N))))).