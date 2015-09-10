#!/bin/sh

cd -- "$(dirname "$0")" || exit 1

# see https://github.com/tst2005/lua-aio
# wget https://raw.githubusercontent.com/tst2005/lua-aio/aio.lua

headn=$(grep -nh '^\]\] and nil$' "makefly" |head -n 1 |cut -d: -f1)

lua -e '
local aio = require "aio"
aio.mode("raw2")

aio.shebang(			"makefly")
aio.codehead('"$headn"',	"makefly")
aio.mod("lib.init",		"lib/init.lua")
aio.mod("pagination",		"lib/pagination.lua")
aio.mod("gettext",		"lib/gettext.lua")
aio.mod("blog",			"lib/blog.lua")
aio.mod("rope",			"lib/rope.lua")
aio.mod("utils",		"lib/utils.lua")
aio.mod("markdown",		"bin/markdown.lua")
aio.finish()
aio.code(			"makefly")
aio.finish()
' > makefly-aio
chmod +x makefly-aio
