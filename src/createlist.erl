-module(createlist).
-exoport([some_function/2]).

some_function([H|T],Result) ->
    some_function(T,[H|Result]);
some_function([],Result)->
    Result.


