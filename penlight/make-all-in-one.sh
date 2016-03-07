#!/bin/sh

cd -- "$(dirname "$0")" || exit 1

# see https://github.com/tst2005/lua-aio
# wget https://raw.githubusercontent.com/tst2005/lua-aio/aio.lua

LUA_PATH="./?.lua;./thirdparty/lua-?/?.lua;;" \
lua -e '
--pcall(require, "mom")
local aio = require "aio"
aio.mode("raw2")

aio.rock.auto("penlight-scm-1.rockspec", "pl")
' > pl.lua


# done with:
#	git clone https://github.com/stevedonovan/Penlight
#	cd Penlight
#	mkdir thirdparty
#	cd thirdparty
#	git clone https://github.com/tst2005/lua-aio
#	git clone https://github.com/tst2005/lua-aio-scripts
#	git clone https://github.com/tst2005/lua-compat-env
#	ln -s lua-compat-env/lua lua-compat_env
#	cd ..
#	ln -s thirdparty/lua-aio-scripts/penlight/make-all-in-one.sh make-all-in-one.sh
#	chmod +x make-all-in-one.sh
#	./make-all-in-one.sh

