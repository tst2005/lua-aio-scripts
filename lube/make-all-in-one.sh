#!/bin/sh

cd -- "$(dirname "$0")" || exit 1

# see https://github.com/tst2005/lua-aio
# wget https://raw.githubusercontent.com/tst2005/lua-aio/aio.lua

LUA_PATH="?.lua;thirdparty/git/tst2005/lua-?/?.lua;;" \
lua -e '
local aio = require "aio"
aio.mode("raw2")

aio.mod("lube.tcp",		"LUBE/tcp.lua")
aio.mod("lube.udp",		"LUBE/udp.lua")
aio.mod("lube.core",		"LUBE/core.lua")
aio.mod("lube.enet",		"LUBE/enet.lua")
aio.finish()

aio.code(			"LUBE/init.lua")
aio.finish()
' > lube.lua


