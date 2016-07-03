#!/bin/sh

cd -- "$(dirname "$0")" || exit 1

# see https://github.com/tst2005/lua-aio
# wget https://raw.githubusercontent.com/tst2005/lua-aio/aio.lua

[ -d "aio" ] || mkdir -- "aio"

LUA_PATH="./?.lua;./thirdparty/lua-?/?.lua;;" \
lua -e '
	local aio = require "aio"
	aio.mode("raw2")
	--aio.rock.auto("rockspecs/telescope-0.6.0-1.rockspec", "tsc")
	aio.rock.auto("modified.rockspec", "tsc")
' > aio/tsc

chmod +x aio/tsc

# done with:
#	git clone https://github.com/norman/telescope telescope
#	cd telescope
#	mkdir thirdparty
#	cd thirdparty
#	git clone https://github.com/tst2005/lua-aio
#	git clone https://github.com/tst2005/lua-aio-scripts
#	cd ..
#	ln -s thirdparty/lua-aio-scripts/telescope/make-all-in-one.sh make-all-in-one.sh
#	ln -s thirdparty/lua-aio-scripts/telescope/modified.rockspec modified.rockspec
#	chmod +x make-all-in-one.sh
#	./make-all-in-one.sh

