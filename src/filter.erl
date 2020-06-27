-module(filter).
-export([filter/2]).



% filter(P,[H|T]) ->filter(P(H),H,P,T);
% filter(P,[]) -> [].

% filter(true,H,P,T) -> [H|filter(P,T)];
% filter(false,H,P,T)->filter(P,T).

filter(P,[])->
    [];
filter(P,[H|T])->
    case P(H) of
        true -> [H|filter(P,T)];
        false -> filter(P,T)
    end.
