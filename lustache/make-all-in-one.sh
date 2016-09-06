#!/bin/sh

cd -- "$(dirname "$0")" || exit 1

# see https://github.com/tst2005/lua-aio
# wget https://raw.githubusercontent.com/tst2005/lua-aio/aio.lua

LUA_PATH="./?.lua;../lua-?/?.lua;thirdparty/git/tst2005/lua-?/?.lua;;" \
lua -e '
local aio = require "aio"
aio.rock.auto("lustache-1.3.1-0.rockspec", "lustache")
' > lustache.lua

