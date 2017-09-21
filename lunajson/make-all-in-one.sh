#!/bin/sh

# see https://github.com/tst2005/lua-aio-scripts

# mkdir tmp
# cd tmp

# git clone https://github.com/tst2005/lunajson
# cd lunajson
# git clone https://github.com/tst2005/lua-aio
# git clone https://github.com/tst2005/lua-aio-scripts
# ln -s lua-aio-scripts/lunajson bundle-setup

# sh bundle-setup/make-all-in-one.sh
# LUA=lua sh bundle-setup/make-all-in-one.sh
# LUA=luajit2.1 sh bundle-setup/make-all-in-one.sh

[ -d generated-bundle ] || mkdir generated-bundle

LUA_PATH="./?.lua;./?/init.lua;./lua-?/generated-bundle/?.lua;;"

LUA_PATH="$LUA_PATH" \
${LUA:-lua} -e '
require"aio".rock.auto("rockspecs/lunajson-1.1-0.rockspec", "lunajson")
' > generated-bundle/lunajson.lua

