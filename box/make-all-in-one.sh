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
aio.mod("mini.class", "mini.class.lua")
aio.finish()

aio.code("sample.lua")
aio.finish()

' > aio/sample.lua

# done with:
#	git clone https://github.com/tst2005/lua-box
#	cd lua-box
#	mkdir thirdparty
#	cd thirdparty
#		git clone https://github.com/tst2005/lua-aio
#		git clone https://github.com/tst2005/lua-aio-scripts
#		git clone https://github.com/tst2005/lua-compat-env ; ln -s lua-compat-env/lua lua-compat_env
#		git clone https://github.com/tst2005/lua-mini
#		#git clone https://github.com/tst2005/......
#	cd ..
#	ln -s thirdparty/lua-aio-scripts/lua-box/make-all-in-one.sh make-all-in-one.sh
#	ln -s thirdparty/lua-aio-scripts/lua-box/box-0.1.0-alpha.rockspec box-0.1.0-alpha.rockspec
#	chmod +x make-all-in-one.sh
#	./make-all-in-one.sh

