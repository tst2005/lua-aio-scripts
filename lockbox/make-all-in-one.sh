#!/bin/sh

cd -- "$(dirname "$0")" || exit 1

# see https://github.com/tst2005/lua-aio
# wget https://raw.githubusercontent.com/tst2005/lua-aio/aio.lua

[ -d aio ] || mkdir aio

LUA_PATH="./?.lua;../lua-?/?.lua;thirdparty/git/tst2005/lua-?/?.lua;;" \
lua -e '
local aio = require "aio"
aio.mode("raw2")

aio.rock.auto("rockspecs/lockbox-0.1.0-0.rockspec", "lockbox")
' > aio/lockbox.lua

[ -d aio/sha1sum ] || mkdir aio/sha1sum
LUA_PATH="./?.lua;../lua-?/?.lua;thirdparty/git/tst2005/lua-?/?.lua;;" \
lua -e '
require "aio".rock.auto("rockspecs-for-aio/sha1sum-minimaldeps.rockspec", "sha1sum")
' > aio/sha1sum/sha1sum.lua

