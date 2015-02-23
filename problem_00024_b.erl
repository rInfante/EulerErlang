-module(problem_00024_b).

-export([solve/0]).

solve()->
	Perms = lists:zip(lists:seq(1,1000000), take(perms(lists:seq(0,9)),1000000)),
	lists:filter(fun({N,_X})->N == 1000000 end, Perms).

perms([]) -> [[]];
perms(L)  -> [[H|T] || H <- L, T <- perms(L--[H])].

take([H|T], N) when N > 0 ->
    [H|take(T, N-1)];
take(_, 0) -> [].

