%% Feel free to use, reuse and abuse the code in this file.

%% @private
-module(blank_page_app).
-behaviour(application).

%% API.
-export([start/2]).
-export([stop/1]).

%% API.

start(_Type, _Args) ->
	Dispatch = cowboy_router:compile([
		{'_', [
			{"/", toppage_handler, []}
		]}
	]),
	{ok, _} = cowboy:start_http(http, 100, [{port, 80},{max_connections, infinity}], [
		{env, [{dispatch, Dispatch}]}
	]),
	blank_page_sup:start_link().

stop(_State) ->
	ok.
