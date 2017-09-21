#!/bin/sh

# see https://github.com/tst2005/lua-aio-scripts

# mkdir tmp
# cd tmp

# git clone https://github.com/tst2005/ljsyscall
# cd ljsyscall
# git clone https://github.com/tst2005/lua-aio
# git clone https://github.com/tst2005/lua-aio-scripts
# ln -s lua-aio-scripts/ljsyscall bundle-setup

# sh bundle-setup/make-all-in-one.sh
# LUA=lua sh bundle-setup/make-all-in-one.sh
# LUA=luajit2.1 sh bundle-setup/make-all-in-one.sh

[ -d generated-bundle ] || mkdir generated-bundle

LUA_PATH="./?.lua;./?/init.lua;./lua-?/generated-bundle/?.lua;;"

[ -d generated-bundle/linux-only ] || mkdir generated-bundle/linux-only
LUA_PATH="$LUA_PATH" \
${LUA:-lua} -e '
local aio = require "aio"
aio.mode("raw2")
aio.rock.auto("bundle-setup/rockspecs-for-aio/ljsyscall-0.12-1.rockspec-for-linux-only-bundle", "syscall")
' > generated-bundle/linux-only/syscall.lua

