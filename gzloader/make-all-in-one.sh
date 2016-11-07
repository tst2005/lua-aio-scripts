#!/bin/sh

cd -- "$(dirname "$0")" || exit 1

# see https://github.com/tst2005/lua-aio
# wget https://raw.githubusercontent.com/tst2005/lua-aio/aio.lua

#headn=$(grep -nh '^_=nil$' bin/featuredlua |head -n 1 |cut -d: -f1)

LUA_PATH="thirdparty/git/tst2005/lua-?/?.lua;;" \
lua -e '
local aio = require "aio"
aio.mode("raw2")

--aio.shebang(			"lmod/gzloader.lua")
--aio.shellcode(		"lmod/gzloader.lua")
aio.mod("compress.deflatelua",	"compress/deflatelua.lua")
aio.finish()
aio.code(			"lmod/gzloader.lua")
aio.finish()
' > gzloader.lua
