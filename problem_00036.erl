-module(problem_00036).

-export([solve/0]).
-export([is_decimal_palindromic/1]).

solve()->
	Range = lists:seq(1,1000000),
	lists:sum(lists:filter(fun(N)-> is_decimal_palindromic(N) and is_binary_palindromic(N) end, Range)).

is_decimal_palindromic(N)->
	IntegerString = integer_to_list(N),
	is_string_palindromic(IntegerString).

is_binary_palindromic(N) ->
	BinaryString = decimal_to_binary_string(N),
	is_string_palindromic(BinaryString).
	
is_string_palindromic(String) ->
	String == lists:reverse(String).
	
decimal_to_binary_string(N)->
	hd(io_lib:format("~.2B", [N])).