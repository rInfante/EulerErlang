-module(problem_00025).
-export([solve/0]).
-export([solve/1]).

solve()->solve(1000).
solve(NumDigits)->
	fib(NumDigits).
	
fib(Digits)->
	fib(Digits, 1, 1, 3).
	
fib(Digits, Fib1, Fib2, Term)->
	Fib0 = Fib1 + Fib2,
	case length(integer_to_list(Fib0)) == Digits of
		true -> Term;
		false->
			io:format("Digits:~w~n",[length(integer_to_list(Fib0))]),
			fib(Digits, Fib0, Fib1, Term+1)
	end.	