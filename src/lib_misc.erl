-module(lib_misc).
-export([for/3,qsort/1,odds_and_evens/1,odds_and_evens_acc/3,odds_and_evens_acc/1,sqrt/1]).


for(Max,Max,F)->[F(Max)];
for(I,Max,F)->[F(I)|for(I+1,Max,F)].

qsort([])->[];
qsort([Pivot|T])->
    qsort([X || X <- T, X < Pivot])
    ++[Pivot]++
    qsort([X || X <- T,X >= Pivot]).

odds_and_evens(L)->
    Odds    = [X || X <- L,(X rem 2) =:= 1],
    Evens   = [X || X <- L,(X rem 2) =:= 0],
    {Odds,Evens}.

odds_and_evens_acc(L)->
    odds_and_evens_acc(L,[],[]).
odds_and_evens_acc([H|T],Odds,Evens)->
    case (H rem 2) of
        1 -> odds_and_evens_acc(T,[H|Odds],Evens);
        0 -> odds_and_evens_acc(T,Odds,[H|Evens])
    end;
odds_and_evens_acc([],Odds,Evens) ->
    {Odds,Evens}.

sqrt(X) when X < 0 ->
    erlang:error({squareRootNagativeArgument,X});
sqrt(X)->
    math:sqrt(X).