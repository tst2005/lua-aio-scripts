#!/bin/sh

cd -- "$(dirname "$0")" || exit 1

# see https://github.com/tst2005/lua-aio
# wget https://raw.githubusercontent.com/tst2005/lua-aio/aio.lua

# mod alternatives			lib/alternatives/alternatives.lua
# mod queue.queue			lib/queue/queue.lua

LUA_PATH="./?.lua;../lua-?/?.lua;thirdparty/git/tst2005/lua-?/?.lua;;" \
lua -e '
local aio = require "aio"
aio.mode("raw2")

aio.shebang( 					"lib/fakelove.lua")
aio.shellcode(					"lib/fakelove.lua")
aio.mod( "compat_env",				"thirdparty/lua-compat-env/lua/compat_env.lua")
aio.mod( "queue",				"thirdparty/lua-queue/queue.lua")

aio.mod( "todo",				"lib/todo.lua")
aio.mod( "love",				"lib/love.lua")
aio.mod( "love.audio",				"lib/love/audio.lua")
aio.mod( "love.event",				"lib/love/event.lua")
aio.mod( "love.filesystem",			"lib/love/filesystem.lua")
aio.mod( "love.font",				"lib/love/font.lua")
aio.mod( "love.graphics",			"lib/love/graphics.lua")
aio.mod( "love.image",				"lib/love/image.lua")
aio.mod( "love.joystick",			"lib/love/joystick.lua")
aio.mod( "love.keyboard",			"lib/love/keyboard.lua")
aio.mod( "love.mouse",				"lib/love/mouse.lua")
aio.mod( "love.physics",			"lib/love/physics.lua")
aio.mod( "love.sound",				"lib/love/sound.lua")
aio.mod( "love.thread",				"lib/love/thread.lua")
aio.mod( "love.timer",				"lib/love/timer.lua")
aio.finish()

--aio.autoaliases()
aio.vfile("embeded/boot",			"embeded/boot.lua")

aio.code(					"lib/fakelove.lua")
aio.finish()
' > bin/fakelove
chmod +x bin/fakelove
