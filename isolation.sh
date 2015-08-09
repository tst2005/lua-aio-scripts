#!/bin/sh

cd -- "$(dirname "$0")" || exit 1

# see https://github.com/tst2005/lua-aio
# wget https://raw.githubusercontent.com/tst2005/lua-aio/aio.lua

#headn=$(grep -nh '^_=nil$' bin/featuredlua |head -n 1 |cut -d: -f1)

LUA_PATH="?.lua;hirdparty/git/tst2005/lua-?/?.lua;;" \
lua -e '
local aio = require "aio"
aio.mode("raw2")

aio.mod("newpackage",		"lib/newpackage.lua")
aio.mod("restricted.debug",	"lib/restricted/debug.lua")
aio.mod("restricted.bit32",	"lib/restricted/bit32.lua")
aio.mod("restricted.io",	"lib/restricted/io.lua")
aio.mod("restricted.os",	"lib/restricted/os.lua")
aio.mod("restricted.table",	"lib/restricted/table.lua")
aio.mod("restricted._file",	"lib/restricted/_file.lua")
aio.mod("restricted.string",	"lib/restricted/string.lua")
aio.mod("restricted.coroutine",	"lib/restricted/coroutine.lua")
aio.mod("restricted.math",	"lib/restricted/math.lua")
aio.mod("compat_env",		"thirdparty/git/davidm/lua-compat-env/lua/compat_env.lua")
aio.mod("bit.numberlua",	"thirdparty/git/davidm/lua-bit-numberlua/lmod/bit/numberlua.lua")
aio.finish()

aio.code(			"lib/isolation.lua")
aio.finish()
' > isolation.lua


