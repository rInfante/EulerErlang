-module(problem_00004).

-export([solve/0]).
%DEBUG
-export([is_string_palindrome/1]).

solve() ->
	ThreeDigitsNumbers = lists:seq(100,999),
	IntegerProducts = [X*Y || X <- ThreeDigitsNumbers, Y <- ThreeDigitsNumbers],
	StringProducts =  lists:map(fun(P) -> integer_to_list(P) end, IntegerProducts),
	StringPalindromes = lists:filter(fun(S) -> is_string_palindrome(S) end, StringProducts),
	IntegerPalindromes = lists:map(fun(P)->list_to_integer(P) end, StringPalindromes),
	lists:max(IntegerPalindromes).

is_string_palindrome(String) ->
	FirstToMidPositions = lists:seq(1, length(String) div 2),
	lists:all(fun(Position)->lists:nth(Position, String) == lists:nth(length(String)-Position+1, String) end, FirstToMidPositions).