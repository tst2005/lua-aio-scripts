#!/bin/sh

cd -- "$(dirname "$0")" || exit 1

# see https://github.com/tst2005/lua-aio
# wget https://raw.githubusercontent.com/tst2005/lua-aio/aio.lua

[ -d "aio" ] || mkdir -- "aio"

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
	aio.rock.auto("ldoc.with-dependencies.fake.rockspec", "ldoc")
' > aio/ldoc-full.lua
chmod +x aio/ldoc-full.lua

[ -d "bin" ] || mkdir -- "bin"
cp -a aio/ldoc-full.lua bin/ldoc

# done with:
#	git clone https://github.com/stevedonovan/LDoc ldoc
#	cd ldoc
#	mkdir thirdparty
#	cd thirdparty
#	git clone https://github.com/tst2005/lua-aio
#	git clone https://github.com/tst2005/lua-aio-scripts
#	git clone //github.com/mpeterv/markdown
#	git clone https://github.com/tst2005/lua-penlight ; cd lua-penlight ; git co allinone ; cd ..
#	cd ..
#	ln -s thirdparty/lua-aio-scripts/ldoc/make-all-in-one.sh make-all-in-one.sh
#	ln -s thirdparty/lua-aio-scripts/ldoc/ldoc.with-dependencies.fake.rockspec
#	chmod +x make-all-in-one.sh
#	./make-all-in-one.sh

