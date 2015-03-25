-module(problem_00035).

-export([solve/0]).
-export([to_digits/1, digits_to_int/1, rotations_loop/3, number_rotations/1]).

solve()->
	Range = lists:seq(10, 1000000),
	NumberRotationsList = lists:map(fun(N)->number_rotations(N) end, Range),
	NumberRotationsAllPrime = lists:filter(fun(L)-> lists:all(fun(I)->is_prime(I) end, L) end, NumberRotationsList),
	length(NumberRotationsAllPrime) + 4.%include also 2,3,5,7

to_digits(N) ->
	lists:map(fun(C) -> C - 48 end, integer_to_list(N)).
	
digits_to_int(L) -> 
	list_to_integer(lists:flatten(lists:map(fun(D)->integer_to_list(D) end, L))).
	
rotate([]) -> [];
rotate([X|XS])-> XS ++ [X].

rotations_loop(L, I, R) ->
	case I of 
		0 ->
			rotations_loop(rotate(L), I+1, [L]);
		I when I == (length(L) - 1) ->
			R ++ [L];
		_Else ->
			rotations_loop(rotate(L), I+1, R ++ [L])
	end.
	
rotations(L) ->
	rotations_loop(L, 0, []).
	
number_rotations(N) ->
	NumberDigits = to_digits(N),
	lists:map(fun(DL)-> digits_to_int(DL) end, rotations(NumberDigits)).
	
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
	
	
	