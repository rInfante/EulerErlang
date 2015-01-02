-module(problem_00010_c).

-export([solve/0]).

solve()->
	lists:sum(lists:filter(fun(N)->is_prime(N) end, lists:seq(1,2000000))).
		
is_prime(N) ->
	if 
		N =<3 -> N >= 2;
		(N rem 2 == 0) or (N rem 3 == 0) -> false;
		true ->
			case lists:any(fun(P)->(N rem P == 0) or (N rem (P+2) == 0) end, lists:seq(5,trunc(math:sqrt(N)),6)) of
				true -> false;
				false -> true			
			end
	end.