#!/bin/sh
erl -pa ebin deps/*/ebin -s blank_page \
	-eval "io:format(\"Blank Page is start!~n\")."
