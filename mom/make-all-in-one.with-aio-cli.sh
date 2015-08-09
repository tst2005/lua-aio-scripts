#!/bin/sh

cd -- "$(dirname "$0")" || exit 1

# see https://github.com/tst2005/lua-aio
# wget https://raw.githubusercontent.com/tst2005/lua-aio/aio.lua
# wget https://raw.githubusercontent.com/tst2005/lua-aio/aio-cli
ALLINONE=./thirdparty/lua-aio/aio-cli

headn=$(grep -nh '^_=nil$' bin/featuredlua |head -n 1 |cut -d: -f1)

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
--shebang			bin/featuredlua \
--codehead $headn		bin/featuredlua \
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
--mod featured			lib/featured.lua \
--mod generic			lib/generic.lua \
\
--mod secs			thirdparty/local/bartbes/secs/secs.lua \
--mod secs-featured		lib/secs-featured.lua \
\
--mod middleclass		thirdparty/git/kikito/middleclass/middleclass.lua \
--mod middleclass-featured	lib/middleclass-featured.lua \
\
--mod 30log			thirdparty/git/yonaba/30log/30logclean.lua \
--mod 30log-featured		lib/30log-featured.lua \
\
--mod compat_env		thirdparty/lua-compat-env/lua/compat_env.lua \
\
--mod hump.class		thirdparty/local/vrld/hump/class.lua \
--mod hump.class-featured	lib/hump-featured.lua \
\
--mod bit.numberlua		thirdparty/lua-bit-numberlua/lmod/bit/numberlua.lua \
\
--mod lunajson			thirdparty/lunajson/lunajson.lua \
--mod utf8			thirdparty/lua-utf8/utf8.lua \
--rawmod cliargs		thirdparty/lua_cliargs/src/cliargs.lua \
\
--mod "ser"			"thirdparty/git/gvx/ser/ser.lua" \
\
--mod "lube"			"thirdparty/local/bartbes/lube/lube.lua" \
\
--mod "isolation"		"thirdparty/lua-isolation/isolation.lua" \
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

