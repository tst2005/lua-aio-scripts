#!/bin/sh

cd -- "$(dirname "$0")" || exit 1

# see https://github.com/tst2005/lua-aio
# wget https://raw.githubusercontent.com/tst2005/lua-aio/aio.lua

LUA_PATH="./?.lua;./thirdparty/lua-?/?.lua;;" \
lua -e '
local aio = require "aio"
local mod, rawmod = aio.mod, aio.rawmod
assert( mod and rawmod )

aio.mode("raw2")

aio.shebang(			"src/init.lua")

mod("util",			"src/util.lua")
mod("compiler",			"src/compiler.lua")
mod("datastructures",		"src/datastructures.lua")
mod("re",			"src/re.lua")
mod("charsets",			"src/charsets.lua")
mod("evaluator",		"src/evaluator.lua")
mod("printers",			"src/printers.lua")
mod("analizer",			"src/analizer.lua")
mod("locale",			"src/locale.lua")
mod("match",			"src/match.lua")
mod("factorizer",		"src/factorizer.lua")
mod("API",			"src/API.lua")
mod("constructors",		"src/constructors.lua")
mod("compat",			"src/compat.lua")
mod("optimizer", 		"src/optimizer.lua")
aio.finish()

aio.code(			"src/init.lua")
aio.finish()
' > lulpeg-aio.lua


