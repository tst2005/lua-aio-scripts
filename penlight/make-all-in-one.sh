#!/bin/sh

cd -- "$(dirname "$0")" || exit 1

# see https://github.com/tst2005/lua-aio
# wget https://raw.githubusercontent.com/tst2005/lua-aio/aio.lua

LUA_PATH="./?.lua;./thirdparty/lua-?/?.lua;;" \
lua -e '
pcall(require, "mom")
local aio = require "aio"

aio.mode("raw2")

-- aio.shebang(			"bin/featuredlua")
-- aio.shellcode(		"bin/featuredlua")

aio.mod("pl.xxxxx", ".../pl/...")

aio.finish()
' > pl.lua


