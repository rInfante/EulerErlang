-module(problem_00026b).
-export([solve/0, identify_recurring_cycle_length/1]).

solve()->ok.


identify_recurring_cycle_length(DecimalNumber)->
	decimal_number_to_digit_list(DecimalNumber).
	

decimal_number_to_digit_list(DecimalNumber)->chars_to_int(no_comma(no_e(float_to_list(DecimalNumber)))).	
no_e(Digits)-> lists:takewhile(fun(C)->C /= 101 end, Digits).
no_comma(Digits)->lists:filter(fun(C)->C /= 46 end, Digits).
chars_to_int(Digits)-> lists:map(fun(C)->C - 48 end, Digits).

detect_recurring_cycle(Digits) ->ok.
	
detect_recurring_cycle(Digits, StartDigit, Length)->