#!/bin/sh

cd -- "$(dirname "$0")" || exit 1

# see https://github.com/tst2005/lua-aio
# wget https://raw.githubusercontent.com/tst2005/lua-aio/aio.lua

[ -d "aio" ] || mkdir -- "aio"

LUA_PATH="./?.lua;./thirdparty/lua-?/?.lua;;" \
lua -e '
local aio = require "aio"
aio.mode("raw2")

aio.code("thirdparty/a1-a1/package.lua") -- emulate the missing require/package
aio.mod("a1", "thirdparty/a1-a1/a1.lua")
aio.finish()

aio.code("sample.lua")
aio.finish()

' > aio/sample.lua

# done with:
#	git clone https://github.com/tst2005/a1-sample
#	cd a1-sample
#	mkdir thirdparty
#	cd thirdparty
#		git clone https://github.com/tst2005/lua-aio
#		git clone https://github.com/tst2005/lua-aio-scripts
#		git clone https://github.com/tst2005/lua-compat-env ; ln -s lua-compat-env/lua lua-compat_env
#		git clone https://github.com/tst2005/a1-a1
#		git clone https://github.com/tst2005/a1-fake
#	cd ..
#	ln -s thirdparty/lua-aio-scripts/a1-sample/make-all-in-one.sh make-all-in-one.sh
#	ln -s thirdparty/lua-aio-scripts/a1-sample/modified.rockspec modified.rockspec
#	chmod +x make-all-in-one.sh
#	./make-all-in-one.sh

