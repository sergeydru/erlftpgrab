%%%-------------------------------------------------------------------
%%% @author sergey
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. Nov 2019 7:10 PM
%%%-------------------------------------------------------------------
-module(erlftpgrab_file).
-author("sergey").

%% API
-export([get_file_md5/1]).


get_file_md5(Path)->
    {ok,Content} = file:read_file(Path),
    string:to_upper(
    lists:flatten([io_lib:format("~2.16.0b",[N]) || <<N>> <= erlang:md5(Content)])).