#!/bin/sh

# see https://github.com/tst2005/lua-aio-scripts

[ -d generated-bundle ] || mkdir generated-bundle

LUA_PATH="./?.lua;./?/init.lua;./lua-?/generated-bundle/?.lua;;"

[ -d generated-bundle/linux-only ] || mkdir generated-bundle/linux-only
LUA_PATH="$LUA_PATH" \
${LUA:-lua} -e '
local aio = require "aio"
aio.mode("raw2")
aio.rock.auto("bundle-setup/rockspecs-for-aio/ljsyscall-0.12-1.rockspec-for-linux-only-bundle", "syscall")
' > generated-bundle/linux-only/syscall.lua
