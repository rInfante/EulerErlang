-module(problem_00003_c).

-export([prime_divisors/1]).

%%DEBUG
-export([divisors/1, is_prime/1, from/1, filter/2, take/2, from_to/2, from_to_step/3, for_each/2]).

divisors(N) ->
	filter(fun(P)-> N rem P == 0 end, from_to(2, trunc(N/2))).
	
is_prime(N) ->
	if 
		N =<3 ->
			N >= 2;
		(N rem 2 == 0) or (N rem 3 == 0) ->
			false;
		true ->
			case any(fun(P)->(N rem P == 0) or (N rem (P+2) == 0) end, from_to_step(5,trunc(math:sqrt(N)),6)) of
				true -> false;
				false -> true			
			end
	end.
	
prime_divisors(N) ->
	for_each(fun(PD)->io:format("~nPrime Divisor: ~w~n",[PD]) end, filter(fun(D) -> is_prime(D) end, divisors(N))).
	
%lazy sequence starting from K: eager head, lazy tail
from(K)	->
	[K|fun()->from(K+1) end].

%filter for lazy sequences
filter(_, []) -> [];
filter(Pred,[Hd|Tl]) ->
	case Pred(Hd) of
		true -> 
			[Hd | fun() -> filter(Pred, Tl()) end];
		false -> 
			filter(Pred,Tl())
	end.
	
any(_, []) -> false;
any(Pred,[Hd|Tl]) ->
	case Pred(Hd) of
		true -> 
			true;
		false -> 
			any(Pred,Tl())
	end.	
	
%take function for lazy sequences
%You pass in the second parameter a function acting on lazy sequences	
take({0,_}, _) 
	-> [];
take(N, _) when N < 0 
	-> [];	
take(N, [Hd|Tl])->
	if
		(N rem 1000000 == 0) ->
			io:format("(~w|~w)", [Hd,N]);
		true ->
			io:format("")
	end,
	Tl1 = Tl(),
	[Hd| fun() -> take(N-1, Tl1) end].
	
from_to_step(N, M, S) ->
	NumItems = M - N + 1,
	filter(fun(X)-> (X - N) rem S == 0 end, take(NumItems, from(N))).
	
from_to(N, M) ->
	from_to_step(N, M, 1).

for_each(_, []) -> [];
for_each(Action, [Hd|Tl]) ->
	Action(Hd),
	Tl1 = Tl(),
	for_each(Action, Tl1).
	
	
	