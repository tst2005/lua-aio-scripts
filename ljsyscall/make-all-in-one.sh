#!/bin/sh

cd -- "$(dirname "$0")" || exit 1

# see https://github.com/tst2005/lua-aio
# wget https://raw.githubusercontent.com/tst2005/lua-aio/aio.lua

[ -d generated-bundle ] || mkdir generated-bundle

LUA_PATH="./?.lua;../lua-?/?.lua;thirdparty/git/tst2005/lua-?/?.lua;;" \
lua -e '
local aio = require "aio"
aio.mode("raw2")

aio.rock.auto("rockspec/ljsyscall-0.12-1.rockspec-for-bundle-linux", "syscall")
' > generated-bundle/syscall.lua

