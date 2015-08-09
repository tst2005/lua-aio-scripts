#!/bin/sh

cd -- "$(dirname "$0")" || exit 1

# see https://github.com/tst2005/lua-aio
# wget https://raw.githubusercontent.com/tst2005/lua-aio/aio.lua

LUA_PATH="?.lua;thirdparty/git/tst2005/lua-?/?.lua;;" \
lua -l "aio" -e '
local aio = require "aio"
aio.mode("raw2")
aio.mod("leg.parser",		"src/parser.lua")
aio.mod("leg.grammar",		"src/grammar.lua")
aio.finish()
aio.code(			"src/init.lua")
aio.finish()
' > leg.lua

