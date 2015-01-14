-module(problem_00012_b_2).

-export([init/0,solve/0]).

init() ->
    {ok, _} = dets:open_file(triangle_numbers, []),
	{ok, _} = dets:open_file(divisors, []).
	
solve()->
	init(),	
	find_triangle_numbers_with_over_n_divisors(2, 5).
	
find_triangle_numbers_with_over_n_divisors(N, ND)->
	TriangleNumber = triangle_number(N),
	DivisorsLength = length(divisors(TriangleNumber)),
	io:format("N:~w; T:~w~n",[N, TriangleNumber]),	
	case DivisorsLength > ND of
		true -> TriangleNumber;
		false -> 
			io:format("T:~w; DivsLength:~w~n", [TriangleNumber, DivisorsLength]),
			find_triangle_numbers_with_over_n_divisors(N+1, ND)
	end.
		
triangle_number(1) -> 1;
triangle_number(N) ->
	memoize(fun(X)->triangle_number(X-1) + X end, N, triangle_numbers).
	
%%NAIVE DIVISORS TOO SLOW!
divisors(N)->
	lists:filter(fun(X)-> N rem X == 0 end, lists:seq(1,N)).
	
memoize(F,N,StoreName) ->
    case dets:lookup(StoreName, N) of
      [] ->
        Result = F(N), 
        dets:insert_new(StoreName, {N, Result}),
        Result;
      [{N, Cached}] ->
        Cached
    end.
	
