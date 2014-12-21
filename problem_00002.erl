-module(problem_00002).

-export([fibonacci_conditional_sum/1]).

fibonacci_conditional_sum(MaxFib) when MaxFib > 0 ->
	fibonacci_conditional_sum(MaxFib, 1, 0, 0);
fibonacci_conditional_sum(_) -> 0.

fibonacci_conditional_sum(MaxFib, Fib, _Previous, Sum) when MaxFib == Fib ->
	io:format("Final Fib: ~w~n",[Fib]),
	conditional_sum(Fib, Sum);
fibonacci_conditional_sum(MaxFib, Fib, Previous, Sum) when MaxFib < Fib ->
	io:format("Final Fib: ~w~n",[Previous]),
	Sum;	
fibonacci_conditional_sum(MaxFib, Fib, Previous, Sum) ->
	io:format("Current Fib: ~w~n",[Fib]),
	fibonacci_conditional_sum(MaxFib, Fib+Previous, Fib, conditional_sum(Fib, Sum)).
	
conditional_sum(Fib, Sum) ->
	case is_even(Fib) of
		true -> Sum + Fib;
		false -> Sum
	end.
	
is_even(Number) -> Number rem 2 == 0.