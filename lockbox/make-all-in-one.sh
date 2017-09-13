#!/bin/sh

cd -- "$(dirname "$0")" || exit 1

# mkdir tmp
# cd tmp

# git clone https://github.com/tst2005/lua-aio
# cd lua-aio
# rm aio.lua ?
# cd ..

# git clone https://github.com/tst2005/lua-lockbox
# cd lua-lockbox
# ( git pull --all )
# ( git branch )
# git checkout allinone-sha1sum
# wget 'https://github.com/tst2005/lua-compat-env/raw/master/lua/compat_env.lua'
# wget 'https://github.com/tst2005/lua-aio-scripts/raw/master/lockbox/make-all-in-one.sh'
# sh make-all-in-one.sh
# LUA=lua sh make-all-in-one.sh
# LUA=luajit2.1 sh make-all-in-one.sh

[ -d aio ] || mkdir aio

LUA_PATH="./?.lua;./?/init.lua;../lua-?/?.lua;thirdparty/git/tst2005/lua-?/?.lua;;" \
${LUA:-lua} -e '
local aio = require "aio"
aio.mode("raw2")

aio.rock.auto("rockspecs/lockbox-0.1.0-0.rockspec", "lockbox")
' > aio/lockbox.lua

[ -d aio/sha1sum ] || mkdir aio/sha1sum
LUA_PATH="./?.lua;../lua-?/?.lua;thirdparty/git/tst2005/lua-?/?.lua;;" \
${LUA:-lua} -e '
require "aio".rock.auto("rockspecs-for-aio/sha1sum-minimaldeps.rockspec", "sha1sum")
' > aio/sha1sum/sha1sum.lua

