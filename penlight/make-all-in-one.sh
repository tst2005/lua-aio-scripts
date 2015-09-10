#!/bin/sh

cd -- "$(dirname "$0")" || exit 1

# see https://github.com/tst2005/lua-aio
# wget https://raw.githubusercontent.com/tst2005/lua-aio/aio.lua

#headn=$(grep -nh '^\]\] and nil$' bin/featuredlua |head -n 1 |cut -d: -f1)

LUA_PATH="./?.lua;./thirdparty/lua-?/?.lua;;" \
lua -e '
pcall(require, "mom")
local aio = require "aio"

aio.mode("raw2")

-- aio.shebang(			"bin/featuredlua")
-- aio.codehead('"$headn"',	"bin/featuredlua")

aio.mod("pl.xxxxx", ".../pl/...")

aio.finish()
' > pl.lua


