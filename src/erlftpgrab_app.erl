%%%-------------------------------------------------------------------
%% @doc erlftpgrab public API
%% @end
%%%-------------------------------------------------------------------

-module(erlftpgrab_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    io:format(".....start.....~n", []),
    application:start(yamerl),
    application:start(mnesia),
    erlftpgrab_sup:start_link().

stop(_State) ->
    mnesia:stop(),
    ok.

%% internal functions
