-module(problem_00024).
-export([solve/0, solve/1]).

solve()->solve("012").
solve(S)->
	N = length(S),
	
	THINKING
	0123
	0132
	0213
	0231
	0312
	0321
	1023
	1032
	1203
	1230
	1302
	1320
	2013
	201
