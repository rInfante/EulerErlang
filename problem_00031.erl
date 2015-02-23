-module(problem_00031).

-export([solve/0]).

%%THIS IS CORRECT BUT GOES OUT OF MEMORY
%%MUST IMPLEMENT WITH SEQUENCE COMPREHENSIONS
%%F# IS BETTER AND SOLVED WITH IT
solve()->
	CoinCombinations = 
		[
			OneP * 0.01 + TwoP * 0.02 + FiveP * 0.05 + 
				TenP * 0.10 + TwentyP * 0.20 + FiftyP * 0.50 +
				OnePound * 1.00 + TwoPounds * 2.00 ||				
			OneP 	<- lists:seq(0, 200),
			TwoP 	<- lists:seq(0, 200),
			FiveP 	<- lists:seq(0, 200),
			TenP 	<- lists:seq(0, 200),
			TwentyP <- lists:seq(0, 200),
			FiftyP 	<- lists:seq(0, 200),
			OnePound <- lists:seq(0, 200),
			TwoPounds<- lists:seq(0, 200)
		],
	length(lists:filter(fun(M)-> M == 2.00 end, CoinCombinations)).
	
