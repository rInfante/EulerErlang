-module(problem_00015).

-export([solve/0]).

solve() ->
	number_of_paths(20).
	
%N = number of cells on a side of the lattice
generate_lattice_nodes(N) ->
	[{X,Y} ||
		X <- lists:seq(1,N+1),
		Y <- lists:seq(1,N+1)].
		
number_of_paths(N) -> lists:sum(lists:seq(1,N+1)).