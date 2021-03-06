%%%-------------------------------------------------------------------
%%% @author Ruslan Babayev <ruslan@babayev.com>
%%% @copyright 2009, Ruslan Babayev
%%% @doc This module handles `TRACE' requests.
%%% @end
%%%-------------------------------------------------------------------
-module(http_mod_trace).
-author('ruslan@babayev.com').
-export([init/0, handle/4]).

-include("http.hrl").

init() ->
    ok.

handle(_Socket, #http_request{method = 'TRACE'} = Request, _Response, _Flags) ->
    Body = http_lib:encode(Request),
    Headers = [{'Content-Type', "message/http"},
	       {'Content-Length', iolist_size(Body)}],
    #http_response{headers = Headers, body = Body};
handle(_Socket, _Request, Response, Flags) ->
    {proceed, Response, Flags}.
