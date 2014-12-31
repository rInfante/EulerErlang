-module(problem_00005).

-export([solve/0]).

%%DEBUG
-export([factor_decompose/3, factor_decomposition/2, multiply_factors/1, factor_with_highest_power/1, least_common_multiple/2, group_by/2]).

solve() ->
	Terms = lists:seq(1,20),
	PrimeFactors = [2,3,5,7,11,13,17,19],
	least_common_multiple(Terms, PrimeFactors).

factor_decompose(N, M, T) ->
	case(N rem trunc(math:pow(M, T))) == 0 of
		true ->
			factor_decompose(N, M, T+1);
		false ->
			{M, T-1}
	end.
	
factor_decomposition(N,PrimeFactors) ->
	FactorsWithExponent = lists:map(fun(P) -> factor_decompose(N, P, 1) end, PrimeFactors),
	lists:filter(fun({_,T}) -> T /= 0 end, FactorsWithExponent).
	
multiply_factors(FactorsWithExponent) ->
	lists:foldl(fun({F, Exp}, Acc) -> Acc*math:pow(F, Exp) end, 1.0, FactorsWithExponent).
	
factor_with_highest_power(FactorsWithExponent) ->
	{Factor, _} = hd(FactorsWithExponent),
	MaxPower = lists:max(lists:map(fun({_,T})-> T end, FactorsWithExponent)),
	{Factor, MaxPower}.
	
least_common_multiple(Terms, PrimeFactors) ->
	AllFactors = lists:map(fun(T)->factor_decomposition(T,PrimeFactors) end, Terms),
	AllFactorsFlat = lists:append(AllFactors),
	GroupedFactors = group_by(fun({N, _})-> N end, AllFactorsFlat),
	FactorsWithHighestPowerKvP = dict:to_list(dict:map(fun(_K,V)->factor_with_highest_power(V) end, GroupedFactors)),
	FactorsWithHighestPowerList = lists:map(fun({_K,V})->V end,FactorsWithHighestPowerKvP),
	multiply_factors(FactorsWithHighestPowerList).
	
group_by(F, L) -> 
	lists:foldr(fun({K,V}, D) -> dict:append(K, V, D) end , dict:new(), [ {F(X), X} || X <- L ]).		