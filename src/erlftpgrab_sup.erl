%%%-------------------------------------------------------------------
%% @doc erlftpgrab top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(erlftpgrab_sup).

-behaviour(supervisor).

-export([start_link/0]).

-export([init/1]).

-define(SERVER, ?MODULE).

start_link() ->
  io:format(".....start_link.....~n", []),
  supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%% sup_flags() = #{strategy => strategy(),         % optional
%%                 intensity => non_neg_integer(), % optional
%%                 period => pos_integer()}        % optional
%% child_spec() = #{id => child_id(),       % mandatory
%%                  start => mfargs(),      % mandatory
%%                  restart => restart(),   % optional
%%                  shutdown => shutdown(), % optional
%%                  type => worker(),       % optional
%%                  modules => modules()}   % optional
init([]) ->
  io:format(".....init.....~n", []),
  SupFlags = #{strategy => one_for_one,
    intensity => 1000,
    period => 3600},
  ChildSpecs = [
    #{id => erlftpgrab_worker,
      start => {erlftpgrab_worker, start_link, []},
      restart => permanent,
      shutdown => 2000,
      type => worker,
      modules => [erlftpgrab_worker]}
  ],
  {ok, {SupFlags, ChildSpecs}}.
%% internal functions





