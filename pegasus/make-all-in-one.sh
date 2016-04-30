!/bin/sh

cd -- "$(dirname "$0")" || exit 1

# see https://github.com/tst2005/lua-aio
# wget https://raw.githubusercontent.com/tst2005/lua-aio/aio.lua

LUA_PATH="./?.lua;../lua-aio/?.lua;../lua-aio/?/init.lua;../lua-compat-env/lua/?.lua;thirdparty/git/tst2005/lua-?/?.lua;;" \
lua -e '
local aio = require "aio"
aio.mode("raw2")

aio.rock.auto("rockspecs/pegasus-0.9.1-1.rockspec", "pegasus")
' > aio/pegasus.lua
