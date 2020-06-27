-module(testif).
-export([function/1]).


function(X)->
    if
        is_number(X)->
            io:format("number \n");
        is_atom(X)->
            io:format("atom \n");
        true->
            io:format("true \n")
    end.

