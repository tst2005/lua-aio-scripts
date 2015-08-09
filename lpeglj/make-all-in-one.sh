#!/bin/sh

cd -- "$(dirname "$0")" || exit 1

# see https://github.com/tst2005/lua-aio
# wget https://raw.githubusercontent.com/tst2005/lua-aio/aio.lua

LUA_PATH="./?.lua;./thirdparty/lua-?/?.lua;../lua-?/?.lua;;" \
lua -e '
local aio = require "aio"
aio.mode("raw2")

aio.mod("lpvm",			"src/lpvm.lua")
aio.mod("re",			"src/re.lua")
aio.mod("lpcode",		"src/lpcode.lua")
aio.mod("lpprint",		"src/lpprint.lua")
aio.mod("lpcap",		"src/lpcap.lua")
aio.finish()

aio.code(			"src/lpeglj.lua")
aio.finish()
' > lpeglj-aio.lua
