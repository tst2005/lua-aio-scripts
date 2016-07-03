#!/bin/sh

cd -- "$(dirname "$0")" || exit 1

# see https://github.com/tst2005/lua-aio
# wget https://raw.githubusercontent.com/tst2005/lua-aio/aio.lua

ROCKSPEC=luacheck-scm-1.rockspec

LUA_PATH="./?.lua;../lua-?/?.lua;./thirdparty/lua-?/?.lua;;" \
lua -e '
--require "gro"
local aio = require "aio"
--aio.mode("raw2")

aio.shebang(			"bin/luacheck.lua")
aio.shellcode(			"bin/luacheck.lua")

aio.rock.file("'"$ROCKSPEC"'")
aio.rock.mod("build.modules")
aio.finish()
aio.autoaliases()
aio.finish()
aio.rock.code("build.install.bin")
aio.finish()

--[[
aio.mod("luacheck.check",			"src/luacheck/check.lua")
aio.mod("luacheck.config",			"src/luacheck/config.lua")
aio.mod("luacheck.options",			"src/luacheck/options.lua")
aio.mod("luacheck.parser",			"src/luacheck/parser.lua")
aio.mod("luacheck.globbing",			"src/luacheck/globbing.lua")
aio.mod("luacheck.lexer",			"src/luacheck/lexer.lua")
aio.mod("luacheck.fs",				"src/luacheck/fs.lua")
aio.mod("luacheck.expand_rockspec",		"src/luacheck/expand_rockspec.lua")
aio.mod("luacheck.multithreading",		"src/luacheck/multithreading.lua")
aio.mod("luacheck.stds",			"src/luacheck/stds.lua")
aio.mod("luacheck.filter",			"src/luacheck/filter.lua")
aio.mod("luacheck.main",			"src/luacheck/main.lua")
aio.mod("luacheck.inline_options",		"src/luacheck/inline_options.lua")
aio.mod("luacheck.linearize",			"src/luacheck/linearize.lua")
aio.mod("luacheck.analyze",			"src/luacheck/analyze.lua")
aio.mod("luacheck.reachability",		"src/luacheck/reachability.lua")
aio.mod("luacheck.core_utils",			"src/luacheck/core_utils.lua")
aio.mod("luacheck.version",			"src/luacheck/version.lua")
aio.mod("luacheck.format",			"src/luacheck/format.lua")
aio.mod("luacheck.utils",			"src/luacheck/utils.lua")
aio.mod("luacheck.argparse",			"src/luacheck/argparse.lua")
aio.mod("luacheck.cache",			"src/luacheck/cache.lua")
--aio.mod("luacheck.init", 			"src/luacheck/init.lua")
aio.mod("luacheck",				"src/luacheck/init.lua")
aio.finish()
--aio.autoaliases()

aio.code(				"bin/luacheck.lua")
aio.finish()
]]--

' > luacheck-aio.lua

chmod +x luacheck-aio.lua

