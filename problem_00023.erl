-module(problem_00023).
-export([solve/0,proper_divisors/1]).

solve()->
	Range = lists:seq(12,30000),
	AbundantNumbers = lists:filter(fun(X)->is_abundant(X) end, Range),
	AbundantNumbersSums = sets:from_list([ X+Y || X<-AbundantNumbers, Y<-AbundantNumbers]),
	Universe=sets:from_list(lists:seq(1,30000)),
	lists:sum(sets:to_list(sets:subtract(Universe,AbundantNumbersSums))).
	
	
is_abundant(N)-> sum_of_proper_divisors(N) > N.
sum_of_proper_divisors(N)->	lists:sum(proper_divisors(N)).
proper_divisors(N) ->lists:filter(fun(X)->N rem X == 0 end, lists:seq(1, N-1)).
%%proper_divisors(N) -> %%from problem 22%%this doesn't work correctly
%%	Core=lists:filter(fun(X)->N rem X == 0 end, lists:seq(1, trunc(math:sqrt(N))+1)),
%%	Derived=lists:map(fun(X)->N div X end, lists:delete(1,Core)),
%%	lists:merge(Core, Derived).