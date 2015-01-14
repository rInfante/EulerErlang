-module(problem_00014).

-export([solve/0]).

solve()->
	CollatzCounts = lists:map(fun(X)-> {X, collatz_sequence_num_items(X)} end, lists:seq(2,1000000)),
	MaxCount=lists:max(lists:map(fun({_X,C}) -> C end, CollatzCounts)),
	lists:filter(fun({_X,C}) -> C == MaxCount end, CollatzCounts).

collatz_sequence_num_items(N) ->
	collatz_sequence_num_items(N, 0).
collatz_sequence_num_items(N, C) ->
	case N == 1 of
		true -> C;
		false ->
			case (N rem 2) == 0 of
				true -> collatz_sequence_num_items(N div 2, C+1);
				false -> collatz_sequence_num_items(3*N + 1, C+1)
			end
	end.