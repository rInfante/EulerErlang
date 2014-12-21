-module(problem_00001).

-export([solve/2]).

%%DEBUG
-export([is_multiple/2,multiples_in_sequence/2]).
		
solve(UpperNumber, FactorList) ->
	Sequence= lists:seq(1, UpperNumber-1),
	MultiplesInSequence = multiples_in_sequence(Sequence, FactorList),
	lists:sum(MultiplesInSequence).
		
%%PRIVATE FUNCTIONS
%Factor is single number		
is_multiple(Number, Factor) when is_number(Factor)->
	Number rem Factor == 0;
is_multiple(Number, FactorList) when is_list(FactorList)->
	IsMultipleChecks = lists:map(fun(Factor)->is_multiple(Number, Factor) end, FactorList),
	IsAnyMultiple = lists:any(fun(IsMultipleCheck) -> IsMultipleCheck end, IsMultipleChecks),
	IsAnyMultiple.

multiples_in_sequence(Sequence, FactorList)  ->
	lists:filter(fun(Number) -> is_multiple(Number, FactorList) end, Sequence).
		