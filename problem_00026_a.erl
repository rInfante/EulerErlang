-module(problem_00026_a).

-export([solve/0]).

solve()->
	Range = lists:filter(fun(N)->is_prime(N) end, lists:seq(999, 900, -1)),
	CyclicInfos = lists:map(fun(P)-> is_cyclic(P) end, Range),
	CyclicNumbers = lists:filter(fun({IsCyclic, _P, _Cycle}) -> IsCyclic == true end, CyclicInfos),
	hd(CyclicNumbers).
	
%algorithm from Wikipedia: Cyclic number
is_cyclic_loop(P, T, R, N) ->
	B = 10,
	T1 = T + 1,
	X = R * B,
	D = X div P,
	R1 = X rem P,
	N1 = N * B + D,
	if
		R1 /= 1 ->
			is_cyclic_loop(P, T1, R1, N1);
		true ->
			if 
				T1 == P - 1 ->
					{true, P, N1};
				true ->
					{false, P, 0}
			end
	end.
	
is_cyclic(P) -> is_cyclic_loop(P, 0, 1, 0).

%%from problem 27
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

