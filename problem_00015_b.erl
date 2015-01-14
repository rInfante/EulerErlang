-module(problem_00015_b).

-export([solve/0, solve/1]).

solve()->solve(2).
solve(N)-> down_seq(N)*2.

%MY ORIGINAL APPROACH
down_seq(N) ->
	down_seq(N, 1,[N],(1+N)).
down_seq(N, C, Last, TotalItems)->
	case C == N - 1 of
		true -> TotalItems;
		false ->
			New = lists:flatten(lists:map(fun(X)->lists:seq(X,1,-1) end, Last)),
			NewTotalItems = TotalItems + lists:sum(New),		
			io:format("C: ~w; NewTotalItems:~w~n",[C,NewTotalItems]),
			down_seq(N, C+1, New, NewTotalItems)
	end.