-module(problem_00032).

-export([solve/0]).
-export([is_pandigital/3]).

solve() -> 
	Products = [ {M, N, M * N} ||
        M <- lists:seq(1, 2000),
        N <- lists:seq(1, 2000)],
	PandigitalProducts = lists:filter(fun({M, N, P}) -> is_pandigital(M, N, P) end, Products),
	PandigitalProductsSum = lists:sum(distinct(lists:map(fun({_M, _N, P}) -> P end, PandigitalProducts))),
	PandigitalProductsSum.

to_digits(N) ->
	lists:map(fun(C) -> C - 48 end, integer_to_list(N)).
distinct(L)->
	sets:to_list(sets:from_list(L)).	
is_pandigital(M, N, P) -> 
	Md = to_digits(N),
	Nd = to_digits(M), 
	Pd = to_digits(P),	
	ActualDigits = lists:sort(lists:append([Md, Nd, Pd])),
	ExpectedDigits = lists:seq(1,9),
	ActualDigits == ExpectedDigits.
	
