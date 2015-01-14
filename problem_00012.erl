-module(problem_00012).

-export([solve/0]).
%DEBUG
-export([triangle_seq/1, for_each/2]).
%%TO REVIEW EVERYTHING!!!

solve()->
	take_while(fun(N)-> length(divisors(N)) > 5 end, triangle_seq(1)).

triangle_seq(K)->
	[K|fun()->triangle_seq(K+K+1) end].
	
divisors(1,_D) ->
    1;
divisors(N, D) ->
	case (N rem D == 0) of
		true ->
			M = N div D,			
			case dets:lookup(values, M) of
			  [] ->
				Result = N * fact(N-1),
				dets:insert_new(values, {N, Result}),
				Result;
			  [{N, Cached}] ->
				Cached
			end.	
	
%Functions on lazy sequences (not native in Erlang)
for_each(_, []) -> [];
for_each(Action, [Hd|Tl]) ->
	Action(Hd),
	for_each(Action, Tl()).
	
sum(Sum,[]) -> Sum;
sum(Sum,[Hd|Tl])->	
	sum(Sum+Hd,Tl()).

take_while(Pred, []) -> [];
take_while(Pred, [Hd|Tl])->
	case Pred(Hd) of
		true -> [Hd|fun()->take_while(Pred, Tl()) end];
		false -> []
	end.