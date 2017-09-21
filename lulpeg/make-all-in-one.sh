#!/bin/sh

[ -d generated-bundle ] || mkdir generated-bundle

LUA_PATH="./?.lua;./?/init.lua;./lua-?/generated-bundle/?.lua;;"

LUA_PATH="$LUA_PATH" \
${LUA:-lua} -e '
require"aio".rock.auto("bundle-setup/rockspecs-for-aio/lulpeg-0.1.0-1.rockspec-for-aio", "lulpeg")
' > generated-bundle/lulpeg.lua


if false; then

LUA_PATH="$LUA_PATH" \
${LUA:-lua} -e '
local aio = require "aio"
local mod = assert(aio.mod)

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

fi
