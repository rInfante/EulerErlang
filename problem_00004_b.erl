-module(problem_00004_b).

-export([solve/0]).

%Inline is_palindrome: string = reverse(string)
solve() ->
	ThreeDigitsNumbers = lists:seq(100,999),
	IntegerProducts = [X*Y || X <- ThreeDigitsNumbers, Y <- ThreeDigitsNumbers],
	StringProducts =  lists:map(fun(P) -> integer_to_list(P) end, IntegerProducts),
	StringPalindromes = lists:filter(fun(S) -> S == lists:reverse(S) end, StringProducts),
	IntegerPalindromes = lists:map(fun(P)->list_to_integer(P) end, StringPalindromes),
	lists:max(IntegerPalindromes).