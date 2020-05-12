-module(erlftpgrab).

%% API exports
-export([main/1]).

%%====================================================================
%% API functions
%%====================================================================

%% escript Entry point
main(_Args) ->
    io:format(".....Starting ErlFtpGrab.....~n", []),
    application:ensure_all_started(erlftpgrab),
    io:format(".....Started ErlFtpGrab.....~n", []),
    timer:sleep(infinity).
%%   erlang:halt(0).

%%====================================================================
%% Internal functions
%%====================================================================
