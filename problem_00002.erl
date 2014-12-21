-module(problem_00002).

-export([fibonacci_filtered_sum/1]).

fibonacci_filtered_sum(MaxFib) ->
	fibonacci_filtered_sum(MaxFib, 1, 0, 0). 

fibonacci_filtered_sum(MaxFib, 1, _Previous, _Sum) when MaxFib == 1 ->
	0; %%return 0 as 1 is a odd value
fibonacci_filtered_sum(MaxFib, 1, _Previous, _Sum) ->
	fibonacci_filtered_sum(MaxFib, 2, 1, 0); %%return 1 as it is an even value	
fibonacci_filtered_sum(MaxFib, Fib, _Previous, Sum) when MaxFib == Fib ->
	io:format("Final Fib: ~w~n",[Fib]),
	conditional_cumulative_sum(Fib, Sum);
fibonacci_filtered_sum(MaxFib, Fib, Previous, Sum) when MaxFib < Fib ->
	io:format("Final Fib: ~w~n",[Previous]),
	Sum;	
fibonacci_filtered_sum(MaxFib, Fib, Previous, Sum) ->
	io:format("Current Fib: ~w~n",[Fib]),
	fibonacci_filtered_sum(MaxFib, Fib+Previous, Fib, conditional_cumulative_sum(Fib, Sum)).
	
conditional_cumulative_sum(Fib, Sum) ->
	if 
		Fib rem 2 == 0 ->
			Sum + Fib;
		true ->
			Sum
	end.