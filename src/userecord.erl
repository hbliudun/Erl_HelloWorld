-module(userecord).
-export([dosomething/1]).

-include("record.hrl").


clear_status(#todo{status=S,who=W} = R)->
    case S of
        reminder -> R#todo{status=done};
        done -> R#todo{status=finished};
        finished -> R#todo{status=exit}
    end.


dosomething(X) when is_record(X,todo)->
    clear_status(X).