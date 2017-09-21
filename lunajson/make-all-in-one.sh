#!/bin/sh

[ -d generated-bundle ] || mkdir generated-bundle

LUA_PATH="./?.lua;./?/init.lua;./lua-?/generated-bundle/?.lua;;"

LUA_PATH="$LUA_PATH" \
${LUA:-lua} -e '
require"aio".rock.auto("rockspecs/lunajson-1.1-0.rockspec", "lunajson")
' > generated-bundle/lunajson.lua

