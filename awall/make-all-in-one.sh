#!/bin/sh

cd -- "$(dirname "$0")" || exit 1

# see https://github.com/tst2005/lua-aio
# wget https://raw.githubusercontent.com/tst2005/lua-aio/aio.lua

LUA_PATH="./?.lua;./thirdparty/lua-?/?.lua;;" \
luajit -e '
require "mom"
--require "gro"
local aio = require "aio"

aio.mode("raw2")

aio.shebang(			"awall-cli")
aio.shellcode(			"awall-cli")

aio.luacode("require \"mom\"")
aio.luacode("require \"gro\"")

aio.mod("awall.uerror", 	"awall/uerror.lua")
aio.mod("awall.class", 		"awall/class.lua")
aio.mod("awall.policy", 	"awall/policy.lua")
aio.mod("awall.optfrag", 	"awall/optfrag.lua")
aio.mod("awall.model", 		"awall/model.lua")
aio.mod("awall.host", 		"awall/host.lua")
aio.mod("awall.ipset", 		"awall/ipset.lua")
aio.mod("awall.util", 		"awall/util.lua")
aio.mod("awall.dependency", 	"awall/dependency.lua")
aio.mod("awall.iptables", 	"awall/iptables.lua")
aio.mod("awall.json",		"awall/json.lua")
aio.mod("awall.compat",		"awall/compat.lua")

aio.mod("awall", 		"awall/init.lua")

aio.mod("stringy", "stringy-emul.lua")
aio.mod("lpc", "lpc-emul.lua")

aio.autoaliases()
aio.finish()

aio.code("awall-cli")
aio.finish()
' > bin/awall
chmod +x bin/awall
