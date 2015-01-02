-module(problem_00009).
-export([solve/0]).

solve()->
	{A,B,C} = hd(pyth(1000)),
	A*B*C.

pyth(N) ->
    [ {A,B,C} ||
        A <- lists:seq(1,N),
        B <- lists:seq(1,N),
        C <- lists:seq(1,N),
        A+B+C == N,
        A*A+B*B == C*C 
    ].