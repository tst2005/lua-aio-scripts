#!/bin/sh

cd -- "$(dirname "$0")" || exit 1

# see https://github.com/tst2005/lua-aio
# wget https://raw.githubusercontent.com/tst2005/lua-aio/aio.lua
# wget https://raw.githubusercontent.com/tst2005/lua-aio/aio-cli
ALLINONE=./thirdparty/lua-aio/aio-cli

ICHECK="";
while [ $# -gt 0 ]; do
	o="$1"; shift
	case "$o" in
		-i) ICHECK=y ;;
	esac
done

LUA_PATH="?.lua;thirdparty/lua-?/?.lua;;" \
"$ALLINONE" \
--mode "raw2" \
--shebang			"bin/featuredlua" \
--shellcode 			"bin/featuredlua" \
\
$(if [ -n "$ICHECK" ]; then
	echo "--icheckinit"
fi) \
\
--mod preloaded			lib/preloaded.lua \
--mod gro			thirdparty/lua-gro/gro.lua \
--mod aio			thirdparty/lua-aio/aio.lua \
\
--mod strict			thirdparty/local/unknown/strict/strict.lua \
\
--mod i				lib/i.lua \
--mod featured			"thirdparty/lua-featured/featured.lua" \
\
--mod secs			thirdparty/local/bartbes/secs/secs.lua \
--mod secs-featured		"thirdparty/lua-featured/secs-featured.lua" \
\
--mod middleclass		thirdparty/git/kikito/middleclass/middleclass.lua \
--mod middleclass-featured	"thirdparty/lua-featured/middleclass-featured.lua" \
\
--mod 30log			thirdparty/git/yonaba/30log/30logclean.lua \
--mod 30log-featured		"thirdparty/lua-featured/30log-featured.lua" \
\
--mod hump.class		thirdparty/local/vrld/hump/class.lua \
--mod hump.class-featured	"thirdparty/lua-featured/hump/class-featured.lua" \
\
--mod compat_env		thirdparty/lua-compat-env/lua/compat_env.lua \
\
--mod bit.numberlua		thirdparty/lua-bit-numberlua/lmod/bit/numberlua.lua \
\
--mod "isolation"		"thirdparty/lua-isolation/isolation.lua" \
--mod "lulpeg"			"thirdparty/lulpeg/lulpeg-aio.lua" \
\
--mod "cwtest"			"thirdparty/lua-cwtest/cwtest.lua" \
$( # --mod "pl.strict"		"thirdparty/lua-penlight/lua/pl/strict.lua"
) \
--mod "pl.pretty"		"thirdparty/lua-penlight/lua/pl/pretty.lua" \
--mod "pl.utils"		"thirdparty/lua-penlight/lua/pl/utils.lua" \
--mod "pl.lexer"		"thirdparty/lua-penlight/lua/pl/lexer.lua" \
--mod "pl.compat"		"emptymodule.lua" \
$( # --mod "pl.compat"		"thirdparty/lua-penlight/lua/pl/compat.lua"
) \
$( # --mod "telescope"		"thirdparty/git/norman/telescope/telescope.lua"
) \
--mod "lunajson"		"thirdparty/lunajson/lunajson.lua" \
--mod "utf8"			"thirdparty/lua-utf8/utf8.lua" \
--rawmod "cliargs"		"thirdparty/lua_cliargs/src/cliargs.lua" \
--mod "alt_getopt"		"thirdparty/lua-alt-getopt/alt_getopt.lua" \
--mod "ser"			"thirdparty/git/gvx/ser/ser.lua" \
--mod "lube"			"thirdparty/local/bartbes/lube/lube.lua" \
$( # --mod "strong"		"thirdparty/strong/strong.lua"
) \
\
$(if [ -n "$ICHECK" ]; then
	echo "--icheck"
fi) \
--finish \
> mom.lua

#--ifndefmod

#--autoaliases
#--code init.lua

#"$ALLINONE" --shebang init.lua $( find hate/ -depth -name '*.lua' |while read -r line; do echo "--mod $(echo "$line" | sed 's,\.lua$,,g' | tr / .) ) --code init.lua

