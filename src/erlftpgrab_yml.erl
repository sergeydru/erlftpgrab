%%%-------------------------------------------------------------------
%%% @author sergey
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 22. Nov 2019 1:38 PM
%%%-------------------------------------------------------------------
-module(erlftpgrab_yml).
-author("sergey").

%% API
-export([get_yml_list/1]).
-export([get_yml_db/1]).
-export([get_yml_download/1]).
-export([get_yml_notif/1]).
-export([get_yml_server/1]).
-export([get_yml_file/1]).



get_yml_list(Path)->
  {ok, Filenames} = file:list_dir(Path),
  RegExp = "([^\\s]+(\\.(?i)(yml))$)",
  lists:filter(fun(X) -> case re:run(X, RegExp) of
                           {match, _ } -> true;
                           _ -> false end end, Filenames).

get_yml_file(File)->
  Data = yamerl_constr:file(File),
  lists:nth(1,Data).

get_yml_server(Data)->
  Server = proplists:get_value("server", Data),
  Type   = proplists:get_value("type", Server),
%%  Ftps   = proplists:get_value("ftps", Server),
  Ftp    = proplists:get_value("ftp", Server),
  Host   = proplists:get_value("host", Ftp),
  Port   = proplists:get_value("port", Ftp),
  Username  = proplists:get_value("username", Ftp),
  Password  = proplists:get_value("password", Ftp),
  Sources   = proplists:get_value("sources", Ftp),
  Timeout   = proplists:get_value("timeout", Ftp),
  DisableEpsv   = proplists:get_value("disable_epsv", Ftp),
  Tls = proplists:get_value("tls", Ftp),
  InsecureSkipVerify   = proplists:get_value("insecure_skip_verify", Ftp),
  LogTrace  = proplists:get_value("log_trace", Ftp).

get_yml_db(Data) ->
  Db = proplists:get_value("db", Data),
  Enable = proplists:get_value("enable", Db),
  Path = proplists:get_value("path", Db).


get_yml_download(Data) ->
  Download = proplists:get_value("download", Data),
  Output = proplists:get_value("output", Download),
  Uid = proplists:get_value("uid", Download),
  Gid = proplists:get_value("gid", Download),
  ChmodFile = proplists:get_value("chmod_file", Download),
  ChmodDir = proplists:get_value("chmod_dir", Download),
  Include =  proplists:get_value("include", Download),
  Exclude =  proplists:get_value("exclude", Download),
  Since =  proplists:get_value("since", Download),
  Retry =  proplists:get_value("retry", Download),
  HideSkipped =  proplists:get_value("hide_skipped", Download),
  CreateBasedir =  proplists:get_value("create_basedir", Download).

get_yml_notif(Data) ->
  Notif = proplists:get_value("notif", Data),
  Mail = proplists:get_value("mail", Notif),
  Enabled = proplists:get_value("enable", Mail),
  HostMail = proplists:get_value("host", Mail),
  PortMail = proplists:get_value("port", Mail),
  Ssl = proplists:get_value("ssl", Mail),
  InsecureSkipVerify = proplists:get_value("insecure_skip_verify", Mail),
  UsernameMail = proplists:get_value("username", Mail),
  PasswordMail = proplists:get_value("password", Mail),
  From = proplists:get_value("from", Mail),
  To = proplists:get_value("to", Mail).


