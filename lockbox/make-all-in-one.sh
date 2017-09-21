#!/bin/sh

#cd -- "$(dirname "$0")/.." || exit 1

# mkdir tmp
# cd tmp

# git clone https://github.com/tst2005/lua-lockbox
# cd lua-lockbox

# git clone https://github.com/tst2005/lua-aio
# git clone https://github.com/tst2005/lua-aio-scripts

# ( ln -s lua-aio/generated-bundle/aio.lua aio.lua )
# ln -s lua-aio-scripts/lockbox bundle-setup

# sh bundle-setup/make-all-in-one.sh
# LUA=lua sh bundle-setup/make-all-in-one.sh
# LUA=luajit2.1 sh bundle-setup/make-all-in-one.sh

[ -d generated-bundle ] || mkdir generated-bundle

LUA_PATH="./?.lua;./?/init.lua;./lua-?/generated-bundle/?.lua;;"

LUA_PATH="$LUA_PATH" \
${LUA:-lua} -e '
local aio = require "aio"
aio.mode("raw2")
aio.rock.auto("rockspecs/lockbox-0.1.0-0.rockspec", "lockbox")
' > generated-bundle/lockbox.lua

[ -d generated-bundle/sha1sum ] || mkdir generated-bundle/sha1sum
LUA_PATH="$LUA_PATH" \
${LUA:-lua} -e '
require "aio".rock.auto("bundle-setup/rockspecs-for-aio/sha1sum-minimaldeps.rockspec", "sha1sum")
' > generated-bundle/sha1sum/sha1sum.lua

[ -d generated-bundle/sha256sum ] || mkdir generated-bundle/sha256sum
LUA_PATH="$LUA_PATH" \
${LUA:-lua} -e '
require "aio".rock.auto("bundle-setup/rockspecs-for-aio/sha256sum-minimaldeps.rockspec", "sha256sum")
' > generated-bundle/sha256sum/sha256sum.lua

