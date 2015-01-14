-module(problem_00011).

-export([solve/0]).

solve()->
	Matrix = 
			[
		{{1,1},8}, {{1,2},2}, {{1,3}, 22}, {{1,4}, 97}, {{1,5}, 38}, {{1,6}, 15}, {{1,7}, 0}, {{1,8}, 40}, {{1,9},0}, {{1,10}, 75}, {{1,11}, 4}, {{1,12}, 5}, {{1,13}, 7}, {{1,14}, 78}, {{1,15}, 52}, {{1,16}, 12}, {{1,17}, 50}, {{1,18}, 77}, {{1,19},  91}, {{1,20}, 8},
		{{2,1},49}, {{2,2},49}, {{2,3}, 99}, {{2,4}, 40}, {{2,5}, 17}, {{2,6}, 81}, {{2,7}, 18}, {{2,8}, 57}, {{2,9},60}, {{2,10}, 87}, {{2,11}, 17}, {{2,12}, 40}, {{2,13}, 98}, {{2,14}, 43}, {{2,15}, 69}, {{2,16}, 48}, {{2,17}, 56}, {{2,18}, 56}, {{2,19},  62}, {{2,20}, 0},         
		{{3,1},81}, {{3,2},49}, {{3,3}, 31}, {{3,4}, 73}, {{3,5}, 55}, {{3,6}, 79}, {{3,7}, 14}, {{3,8}, 29}, {{3,9},93}, {{3,10}, 71}, {{3,11}, 40}, {{3,12}, 67}, {{3,13}, 53}, {{3,14}, 88}, {{3,15}, 30}, {{3,16}, 3}, {{3,17}, 49}, {{3,18}, 13}, {{3,19},  36}, {{3,20}, 65},
		{{4,1},52}, {{4,2},70}, {{2,3}, 95}, {{4,4}, 23}, {{4,5}, 4}, {{4,6}, 60}, {{4,7}, 11}, {{4,8}, 42}, {{4,9},69}, {{4,10}, 24}, {{4,11}, 68}, {{4,12}, 56}, {{4,13}, 1}, {{4,14}, 32}, {{4,15}, 56}, {{4,16}, 71}, {{4,17}, 37}, {{4,18}, 2}, {{4,19}, 36}, {{4,20}, 91},
		{{5,1},22}, {{5,2},31}, {{5,3}, 16}, {{5,4}, 71}, {{5,5}, 51}, {{5,6}, 67}, {{5,7}, 63}, {{5,8}, 89}, {{5,9},41}, {{5,10}, 92}, {{5,11}, 36}, {{5,12}, 54}, {{5,13}, 22}, {{5,14}, 40}, {{5,15}, 40}, {{5,16}, 28}, {{5,17}, 66}, {{5,18}, 33}, {{5,19},  13}, {{5,20}, 80},
		{{6,1},24}, {{6,2},47}, {{6,3}, 32}, {{6,4}, 60}, {{6,5}, 99}, {{6,6}, 3}, {{6,7}, 45}, {{6,8}, 2}, {{6,9},44}, {{6,10}, 75}, {{6,11}, 33}, {{6,12}, 53}, {{6,13}, 78}, {{6,14}, 36}, {{6,15}, 84}, {{6,16}, 20}, {{6,17}, 35}, {{6,18}, 17}, {{6,19},  12}, {{6,20}, 50},       
		{{7,1},32}, {{7,2},98}, {{7,3}, 81}, {{7,4}, 28}, {{7,5}, 64}, {{7,6}, 23}, {{7,7}, 67}, {{7,8}, 10}, {{7,9},26}, {{7,10}, 38}, {{7,11}, 40}, {{7,12}, 67}, {{7,13}, 59}, {{7,14}, 54}, {{7,15}, 70}, {{7,16}, 66}, {{7,17}, 18}, {{7,18}, 38}, {{7,19},  64}, {{7,20}, 70},
		{{8,1},67}, {{8,2},26}, {{8,3}, 20}, {{8,4}, 68}, {{8,5}, 2}, {{8,6}, 62}, {{8,7}, 12}, {{8,8}, 20}, {{8,9},95}, {{8,10}, 63}, {{8,11}, 94}, {{8,12}, 39}, {{8,13}, 63}, {{8,14}, 8}, {{8,15}, 40}, {{8,16}, 91}, {{8,17}, 66}, {{8,18}, 49}, {{8,19},  94}, {{8,20}, 21},  
		{{9,1},24}, {{9,2},55}, {{9,3}, 58}, {{9,4}, 05}, {{9,5}, 66}, {{9,6}, 73}, {{9,7}, 99}, {{9,8}, 26}, {{9,9},97}, {{9,10}, 17}, {{9,11}, 78}, {{9,12}, 78}, {{9,13}, 96}, {{9,14}, 83}, {{9,15}, 14}, {{9,16}, 88}, {{9,17}, 34}, {{9,18}, 89}, {{9,19},  63}, {{9,20}, 72},	
		{{10,1},21}, {{10,2},36}, {{10,3}, 23}, {{10,4}, 9}, {{10,5}, 75}, {{10,6}, 0}, {{10,7}, 76}, {{10,8}, 44}, {{10,9},20}, {{10,10}, 45}, {{10,11}, 35}, {{10,12}, 14}, {{10,13}, 0}, {{10,14}, 61}, {{10,15}, 33}, {{10,16}, 97}, {{10,17}, 34}, {{10,18}, 31}, {{10,19},  33}, {{10,20}, 95},       	
		{{11,1},78}, {{11,2},17}, {{11,3}, 53}, {{11,4}, 28}, {{11,5}, 17}, {{11,6}, 75}, {{11,7}, 31}, {{11,8}, 67}, {{11,9},15}, {{11,10}, 94}, {{11,11}, 3}, {{11,12}, 80}, {{11,13}, 4}, {{11,14}, 62}, {{11,15}, 16}, {{11,16}, 14}, {{11,17}, 9}, {{11,18}, 53}, {{11,19},  56}, {{11,20},92},         
		{{12,1},16}, {{12,2},39}, {{12,3}, 5}, {{12,4}, 42}, {{12,5}, 96}, {{12,6}, 35}, {{12,7}, 31}, {{12,8}, 47}, {{12,9},55}, {{12,10}, 58}, {{12,11}, 88}, {{12,12}, 24}, {{12,13}, 0}, {{12,14}, 17}, {{12,15}, 54}, {{12,16}, 24}, {{12,17}, 36}, {{12,18}, 29}, {{12,19},  85}, {{12,20}, 57},         
		{{13,1},86}, {{13,2},56}, {{13,3}, 0}, {{13,4}, 48}, {{13,5}, 35}, {{13,6}, 71}, {{13,7}, 89}, {{13,8}, 7}, {{13,9},5}, {{13,10}, 44}, {{13,11}, 88}, {{13,12}, 37}, {{13,13}, 44}, {{13,14}, 60}, {{13,15}, 21}, {{13,16}, 58}, {{13,17}, 51}, {{13,18}, 54}, {{13,19},  17}, {{13,20}, 58},		
		{{14,1},19}, {{14,2},80}, {{14,3}, 81}, {{14,4}, 68}, {{14,5}, 5}, {{14,6}, 94}, {{14,7}, 47}, {{14,8}, 69}, {{14,9},28}, {{14,10}, 73}, {{14,11}, 92}, {{14,12}, 13}, {{14,13}, 86}, {{14,14}, 52}, {{14,15}, 17}, {{14,16}, 77}, {{14,17}, 4}, {{14,18}, 89}, {{14,19},  55}, {{14,20}, 40},         
		{{15,1},4}, {{15,2},52}, {{15,3}, 8}, {{15,4}, 83}, {{15,5}, 97}, {{15,6}, 35}, {{15,7}, 99}, {{15,8}, 16}, {{15,9},7}, {{15,10}, 97}, {{15,11}, 57}, {{15,12}, 32}, {{15,13}, 16}, {{15,14}, 26}, {{15,15}, 26}, {{15,16}, 79}, {{15,17}, 33}, {{15,18}, 27}, {{15,19},  98}, {{15,20}, 66},         
		{{16,1},88}, {{16,2},36}, {{16,3}, 68}, {{16,4}, 87}, {{16,5}, 57}, {{16,6}, 62}, {{16,7}, 20}, {{16,8}, 72}, {{16,9},3}, {{16,10}, 46}, {{16,11}, 33}, {{16,12}, 67}, {{16,13}, 46}, {{16,14}, 55}, {{16,15}, 12}, {{16,16}, 32}, {{16,17}, 63}, {{16,18}, 93}, {{16,19},  53}, {{16,20}, 69},         
		{{17,1},4}, {{17,2},42}, {{17,3}, 16}, {{17,4}, 73}, {{17,5}, 38}, {{17,6}, 25}, {{17,7}, 39}, {{17,8}, 11}, {{17,9},24}, {{17,10}, 94}, {{17,11}, 72}, {{17,12}, 18}, {{17,13}, 8}, {{17,14}, 46}, {{17,15}, 29}, {{17,16}, 32}, {{17,17}, 40}, {{17,18}, 62}, {{17,19},  76}, {{17,20}, 36},         
		{{18,1},20}, {{18,2},69}, {{18,3}, 36}, {{18,4}, 41}, {{18,5}, 72}, {{18,6}, 30}, {{18,7}, 23}, {{18,8}, 88}, {{18,9},34}, {{18,10}, 62}, {{18,11}, 99}, {{18,12}, 69}, {{18,13}, 82}, {{18,14}, 67}, {{18,15}, 59}, {{18,16}, 85}, {{18,17}, 74}, {{18,18}, 4}, {{18,19},  36}, {{18,20}, 16},         		
		{{19,1},20}, {{19,2},73}, {{19,3}, 35}, {{19,4}, 29}, {{19,5}, 78}, {{19,6}, 31}, {{19,7}, 90}, {{19,8}, 1}, {{19,9},74}, {{19,10}, 31}, {{19,11}, 49}, {{19,12}, 71}, {{19,13}, 48}, {{19,14}, 86}, {{19,15}, 81}, {{19,16}, 16}, {{19,17}, 23}, {{19,18}, 57}, {{19,19},  5}, {{19,20}, 54}, 
		{{20,1},1}, {{20,2},70}, {{20,3}, 54}, {{20,4}, 71}, {{20,5}, 83}, {{20,6}, 51}, {{20,7}, 54}, {{20,8}, 69}, {{20,9},16}, {{20,10}, 92}, {{20,11}, 33}, {{20,12}, 48}, {{20,13}, 61}, {{20,14}, 43}, {{20,15}, 52}, {{20,16}, 1}, {{20,17}, 89}, {{20,18}, 19}, {{20,19},  67}, {{20,20}, 48} 
			],
		
	HighestProductOnColumns = highest_product_on_columns(Matrix, 20, 4),
	HighestProductOnRows = highest_product_on_rows(Matrix, 20, 4),
	HighestProductOnTopRightDiag = highest_product_on_top_right_diags(Matrix, 20, 4),
	HighestProductOnBottomLeftDiag = highest_product_on_bottom_left_diags(Matrix, 20, 4),
	io:format("Highest product on cols:~w; on rows:~w; top diag:~w, bottom diag:~w~n", [HighestProductOnColumns, HighestProductOnRows, HighestProductOnTopRightDiag, HighestProductOnBottomLeftDiag]).
	
highest_product_on_columns(Matrix, NumColumns, NumDigits)->	lists:max(lists:map(fun(Column)->highest_product_on_line(Matrix, Column, NumDigits, fun get_column/2) end, lists:seq(1,NumColumns))).
get_column(Matrix, Column)->lists:filter(fun({{_X,Y},_N})-> Y == Column end, Matrix).

highest_product_on_rows(Matrix, NumRows, NumDigits)->lists:max(lists:map(fun(Row)->highest_product_on_line(Matrix, Row, NumDigits, fun get_row/2) end, lists:seq(1,NumRows))).
get_row(Matrix, Row)->lists:filter(fun({{X,_Y},_N})-> X == Row end, Matrix).

highest_product_on_top_right_diags(Matrix, NumCols, NumDigits)->lists:max(lists:map(fun(StartCol)->highest_product_on_line(Matrix, StartCol, NumDigits, fun get_top_diag/2) end, lists:seq(1,NumCols))).
get_top_diag(Matrix, StartCol)->lists:filter(fun({{X,Y},_N})-> X == Y - StartCol + 1 end, Matrix).

highest_product_on_bottom_left_diags(Matrix, NumRows, NumDigits)->lists:max(lists:map(fun(StartRow)->highest_product_on_line(Matrix, StartRow, NumDigits, fun get_bottom_diag/2) end, lists:seq(1,NumRows))).
get_bottom_diag(Matrix, StartRow)->lists:filter(fun({{X,Y},_N})-> Y == X - StartRow + 1 end, Matrix).

highest_product_on_top_left_diags(Matrix, NumRows, NumDigits)->lists:max(lists:map(fun(StartRow)->highest_product_on_line(Matrix, StartRow, NumDigits, fun get_top_left_diag/2) end, lists:seq(1,NumRows))).
get_top_left_diag(Matrix, StartRow)->lists:filter(fun({{X,Y},_N})-> Y == X - StartRow - 1 end, Matrix).

highest_product_on_line(Matrix, StartCol, NumDigits, F)->highest_product(get_numbers_list(F(Matrix, StartCol)),NumDigits).
get_numbers_list(MatrixLine)->lists:map(fun({_V,W})->W end, MatrixLine).

%%IN THE END JUST DONE WITH EXCEL BECAUSE THE DIAGONALS ARE NOT RIGHT ;)
	
%FROM PROBLEM 8
highest_product(BigNumberList, NumDigits) ->
	highest_product(BigNumberList, NumDigits, 1, 1).
	
highest_product(BigNumberList, NumDigits, CurrentStart, CurrentMaxProduct) ->
	case (length(BigNumberList) - CurrentStart < NumDigits) of
		true -> CurrentMaxProduct;
		false -> highest_product(BigNumberList, NumDigits, CurrentStart+1, max(CurrentMaxProduct,lists:foldl(fun(Acc,D)->Acc*D end, 1, lists:sublist(BigNumberList, CurrentStart, NumDigits))))		
	end.
	