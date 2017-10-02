#!/bin/sh

# see https://github.com/tst2005/lua-aio-scripts

[ -d generated-bundle ] || mkdir generated-bundle

LUA_PATH="./?.lua;./?/init.lua;./lua-?/generated-bundle/?.lua;;"

LUA_PATH="$LUA_PATH" \
${LUA:-lua} -e '
require "aio".rock.auto("bundle-setup/rockspecs-for-aio/obey-0.1.0-7.rockspec", "obeybin")
' > generated-bundle/obey.lua

