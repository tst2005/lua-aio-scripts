#!/bin/sh

cd -- "$(dirname "$0")" || exit 1

# see https://github.com/tst2005/lua-aio
# wget https://raw.githubusercontent.com/tst2005/lua-aio/aio.lua

LUA_PATH="./?.lua;./thirdparty/lua-?/?.lua;;" \
lua -e '
	local aio = require "aio"
	aio.mode("raw2")

	aio.rock.auto("ldoc-scm-2.rockspec", "ldoc")
' > aio/ldoc-only.lua


LUA_PATH="./?.lua;./thirdparty/lua-?/?.lua;;" \
lua -e '
	local aio = require "aio"
	aio.mode("raw2")
	aio.rock.auto("aio/ldoc-fake.rockspec", "ldoc")
' > aio/ldoc
chmod +x aio/ldoc


# done with:
#	git clone https://github.com/stevedonovan/LDoc ldoc
#	cd ldoc
#	mkdir thirdparty
#	cd thirdparty
#	git clone https://github.com/tst2005/lua-aio
#	git clone https://github.com/tst2005/lua-aio-scripts
#	git clone https://github.com/tst2005/lua-compat-env
#	ln -s lua-compat-env/lua lua-compat_env
#	cd ..
#	ln -s thirdparty/lua-aio-scripts/ldoc/make-all-in-one.sh make-all-in-one.sh
#	chmod +x make-all-in-one.sh
#	mkdir aio
#	./make-all-in-one.sh

