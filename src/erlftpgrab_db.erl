%%%-------------------------------------------------------------------
%%% @author sergey
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 16. Nov 2019 3:27 PM
%%%-------------------------------------------------------------------
-module(erlftpgrab_db).
-author("sergey").

-record(er_file, {
  filename :: binary(),    % username is a binary field
  path :: binary(),    % username is a binary field
  md5 :: binary()     % password is a binary field
}).

%% API
-export([create_table/0]).
-export([insert_file/3]).
-export([find_md5/1]).
-export([find_file/1]).

create_table() ->
      mnesia:create_schema([node()]),      % create database for this node
      mnesia:start(),                      % starts database connection
      mnesia:create_table(er_file,
        [{disc_copies, [node()]},
            {attributes,
              record_info(fields, er_file)}]).

% insert_user is a function having 3 parameter Filename, Md5, Path
insert_file(Filename, Path, Password) ->
  Insert =
    fun() ->
      mnesia:write(
        #er_file{
          filename = Filename,
          path = Path,
          md5 = Password
        })
    end,
  {atomic, Results} = mnesia:transaction(Insert).  % Transaction writes data to database. Results will return ok if success


find_file(Filename) ->
  Query =
    fun() ->
      mnesia:match_object({er_file, Filename, '_', '_'})
    end,
  {atomic, Results} = mnesia:transaction(Query).

find_md5(Md5) ->
  Query =
    fun() ->
      mnesia:match_object({er_file, '_', '_', Md5})
    end,
  {atomic, Results} = mnesia:transaction(Query).