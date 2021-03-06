-module(problem_00018).

-export([solve/0]).
-export([max_lower/2]).

solve()->solve(15).
solve(N)->
	TreeList = [
			{{1,1},75},														
			{{2,1},95},	{{2,2},64},													
			{{3,1},17},	{{3,2},47},	{{3,3},82},												
			{{4,1},18},	{{4,2},35},	{{4,3},87},	{{4,4},10},											
			{{5,1},20},	{{5,2},4},	{{5,3},82},	{{5,4},47},	{{5,5},65},										
			{{6,1},19},	{{6,2},1},	{{6,3},23},	{{6,4},75},	{{6,5},3},	{{6,6},34},									
			{{7,1},88},	{{7,2},2},	{{7,3},77},	{{7,4},73},	{{7,5},7},	{{7,6},63},	{{7,7},67},								
			{{8,1},99},	{{8,2},65},	{{8,3},4},	{{8,4},28},	{{8,5},6},	{{8,6},16},	{{8,7},70},	{{8,8},92},							
			{{9,1},41},	{{9,2},41},	{{9,3},26},	{{9,4},56},	{{9,5},83},	{{9,6},40},	{{9,7},80},	{{9,8},70},	{{9,9},33},						
			{{10,1},41},	{{10,2},48},	{{10,3},72},	{{10,4},33},	{{10,5},47},	{{10,6},32},	{{10,7},37},	{{10,8},16},	{{10,9},94},	{{10,10},29},					
			{{11,1},53},	{{11,2},71},	{{11,3},44},	{{11,4},65},	{{11,5},25},	{{11,6},43},	{{11,7},91},	{{11,8},52},	{{11,9},97},	{{11,10},51},	{{11,11},14},				
			{{12,1},70},	{{12,2},11},	{{12,3},33},	{{12,4},28},	{{12,5},77},	{{12,6},73},	{{12,7},17},	{{12,8},78},	{{12,9},39},	{{12,10},68},	{{12,11},17},	{{12,12},57},			
			{{13,1},91},	{{13,2},71},	{{13,3},52},	{{13,4},38},	{{13,5},17},	{{13,6},14},	{{13,7},91},	{{13,8},43},	{{13,9},58},	{{13,10},50},	{{13,11},27},	{{13,12},29},	{{13,13},48},		
			{{14,1},63},	{{14,2},66},	{{14,3},4},	{{14,4},68},	{{14,5},89},	{{14,6},53},	{{14,7},67},	{{14,8},30},	{{14,9},73},	{{14,10},16},	{{14,11},69},	{{14,12},87},	{{14,13},40},	{{14,14},31},	
			{{15,1},4},	{{15,2},62},	{{15,3},98},	{{15,4},27},	{{15,5},23},	{{15,6},9},	{{15,7},70},	{{15,8},98},	{{15,9},73},	{{15,10},93},	{{15,11},38},	{{15,12},53},	{{15,13},60},	{{15,14},4},	{{15,15},23}
				],
	find_max_path(TreeList, N-1, lists:filter(fun({{R,_C},_V})->R == N end, TreeList)).
	
find_max_path(TreeList, RowNum, NextRow) ->
	case RowNum == 0 of
		true -> 
			[{{_R0,_C0},V0}] = NextRow,
			V0;
		false ->	
			ThisRow = lists:filter(fun({{R,_C},_V})->R == RowNum end, TreeList),
			NewThisRow = lists:map(fun({{R,C},V})-> {{R,C},V + max_lower(C, NextRow)} end ,ThisRow),
			find_max_path(TreeList, RowNum-1, NewThisRow)
	end.

max_lower(ColNum, Row) -> 
	{{_IR1, _IC1}, IV1} = hd(lists:filter(fun({{_R1,C1},_V1})-> C1 == ColNum end,Row)),
	{{_IR2, _IC2}, IV2} = hd(lists:filter(fun({{_R2,C2},_V2})-> C2 == ColNum+1 end,Row)),
	max(IV1, IV2).
	
%%% TRY USING ZIPWITH AGAINST A ROW, and SAME ROW with removed head, so that we can pre calc all the MAX(x1,X2)
%%% THEN WE CAN PERFORM A VERTICAL ZIPWITH TO PROGRESSIVELY SUM