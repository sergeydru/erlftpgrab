%%%-------------------------------------------------------------------
%% @doc erlftpgrab public API
%% @end
%%%-------------------------------------------------------------------

-module(erlftpgrab_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    erlftpgrab_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
