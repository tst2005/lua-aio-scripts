#!/bin/sh

[ -d generated-bundle ] || mkdir generated-bundle

LUA_PATH="./?.lua;./?/init.lua;./lua-?/generated-bundle/?.lua;;"

LUA_PATH="$LUA_PATH" \
${LUA:-lua} -e '
require"aio".rock.auto("ldoc-scm-2.rockspec", "ldoc")
' > generated-bundle/ldoc-only.lua

LUA_PATH="$LUA_PATH" \
${LUA:-lua} -e '
require"aio".rock.auto("bundle-setup/rockspecs-for-aio/ldoc.with-dependencies.fake.rockspec", "ldoc")
' > generated-bundle/ldoc-full.lua
chmod +x generated-bundle/ldoc-full.lua

[ -d "bin" ] || mkdir -- "bin"
cp -a generated-bundle/ldoc-full.lua bin/ldoc
