#!/bin/sh

cd -- "$(dirname "$0")" || exit 1

# see https://github.com/tst2005/lua-aio
# wget https://raw.githubusercontent.com/tst2005/lua-aio/aio.lua

LUA_PATH="./?.lua;../lua-?/?.lua;thirdparty/git/tst2005/lua-?/?.lua;;" \
lua -e '
local aio = require "aio"
aio.mode("raw2")

aio.rock.auto("rockspecs/lunajson-1.1-0.rockspec", "lunajson")
--[[
aio.shebang(				"src/lunajson.lua")
aio.mod("lunajson._str_lib",		"src/lunajson/_str_lib.lua")
aio.rawmod("lunajson._str_lib_lua53", 	"src/lunajson/_str_lib_lua53.lua")
aio.mod("lunajson.sax", 		"src/lunajson/sax.lua")
aio.mod("lunajson.decoder",		"src/lunajson/decoder.lua")
aio.mod("lunajson.encoder",		"src/lunajson/encoder.lua")
aio.finish()

aio.code(				"src/lunajson.lua")
aio.finish()
]]--
' > lunajson.lua

