-module(problem_00012_b).

-export([init/0,solve/0, divisors/1]).

init() ->
    {ok, _} = dets:open_file(triangle_numbers, []),
	{ok, _} = dets:open_file(divisors, []).
	
solve()->
	init(),
	find_triangle_numbers_with_over_n_divisors(2, 500).
	
find_triangle_numbers_with_over_n_divisors(N, ND)->
	TriangleNumber = triangle_number(N),
	io:format("T:~w~n",[TriangleNumber]),
	case length(divisors(TriangleNumber)) > ND of
		true -> TriangleNumber;
		false -> 
			io:format("T:~w; Divs:~w~n", [TriangleNumber, divisors(TriangleNumber)]),
			find_triangle_numbers_with_over_n_divisors(N+1, ND)
	end.
	
	
triangle_number(1) -> 1;
triangle_number(N) ->
	memoize(fun(X)->triangle_number(X-1) + X end, N, triangle_numbers).
	
%%%%%MEMOISED DIVISORS NOT RIGHT
divisors(N)->
	divisors_calc(N,2,[1]).

divisors_calc(N,D, DivList) ->
	case D == N of
		true -> [D|DivList]	;
		false -> 
			case N rem D == 0 of
				true -> 
					Division = N div D,
					case dets:lookup(divisors, Division) of 
						[] ->	
							Result = divisors_calc(N,D+1, [D|DivList]),
							dets:insert_new(divisors, {N, Result}),
							Result;
						[{_M, CachedDivisors}] ->
							io:format("N:~w; D:~w; Division:~w, _M:~w, CachedDivisors:~w~n",[N, D, Division,_M,CachedDivisors]),
							[N|CachedDivisors]
					end;
				false -> divisors_calc(N,D+1, DivList)
			end	
	end.
	
memoize(F,N,StoreName) ->
    case dets:lookup(StoreName, N) of
      [] ->
        Result = F(N), 
        dets:insert_new(StoreName, {N, Result}),
        Result;
      [{N, Cached}] ->
        Cached
    end.
	
