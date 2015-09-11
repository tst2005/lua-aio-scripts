#!/bin/sh

cd -- "$(dirname "$0")" || exit 1

# see https://github.com/tst2005/lua-aio
# wget https://raw.githubusercontent.com/tst2005/lua-aio/aio.lua

LUA_PATH="thirdparty/git/tst2005/lua-?/?.lua;;" \
lua -e '
local aio = require "aio"
local mod = assert(aio.mod)

aio.mode("raw2")

aio.shebang(				"src/lunajson.lua")
mod("lunajson._str_lib",		"src/lunajson/_str_lib.lua")
aio.rawmod("lunajson._str_lib_lua53", 	"src/lunajson/_str_lib_lua53.lua")
mod("lunajson.sax", 			"src/lunajson/sax.lua")
mod("lunajson.decoder",			"src/lunajson/decoder.lua")
mod("lunajson.encoder",			"src/lunajson/encoder.lua")
aio.finish()
aio.code(				"src/lunajson.lua")
aio.finish()
' > lunajson.lua

