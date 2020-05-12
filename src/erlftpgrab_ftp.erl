%%%-------------------------------------------------------------------
%%% @author sergey
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 15. Nov 2019 7:29 PM
%%%-------------------------------------------------------------------
-module(erlftpgrab_ftp).
-author("sergey").

%% API
-export([get_ftp/6]).


get_ftp (Host,Login,Password,FtpPath,LocalPath,File) ->
  ftp:start(),
  {ok, Pid} = ftp:start_service([{host, Host}]),
  ftp:user(Pid, Login, Password),
  ftp:pwd(Pid),
  ftp:cd(Pid, FtpPath),
 %% ftp:lpwd(Pid),
  ftp:lcd(Pid, LocalPath),
  ftp:recv(Pid, File),
  ftp:stop_service(Pid),
  ftp:stop().

