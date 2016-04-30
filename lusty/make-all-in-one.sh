#!/bin/sh

cd -- "$(dirname "$0")" || exit 1

# see https://github.com/tst2005/lua-aio
# wget https://raw.githubusercontent.com/tst2005/lua-aio/aio.lua

for mode in lua raw raw2; do

LUA_PATH="./?.lua;./thirdparty/lua-?/?.lua;../lua-aio/?.lua;;" \
lua -e '
local aio = require "aio"
aio.mode("'"$mode"'")
aio.shebang(			"init.lua")
local _ = aio.shellcode(			"init.lua") or aio.shellcode("hate/init.lua")

aio.mod("hate.graphics", "./hate/graphics.lua")
aio.mod("hate.opengl", "./hate/opengl.lua")
aio.mod("hate.window", "./hate/window.lua")
aio.mod("hate.system", "./hate/system.lua")
aio.mod("hate.filesystem", "./hate/filesystem.lua")
aio.mod("hate.sdl2.defines", "./hate/sdl2/defines.lua")
aio.mod("hate.sdl2.cdefs", "./hate/sdl2/cdefs.lua")
aio.mod("hate.sdl2.init", "./hate/sdl2/init.lua")
aio.mod("hate.cpml.modules.intersect", "./hate/cpml/modules/intersect.lua")
aio.mod("hate.cpml.modules.vec3", "./hate/cpml/modules/vec3.lua")
aio.mod("hate.cpml.modules.constants", "./hate/cpml/modules/constants.lua")
aio.mod("hate.cpml.modules.simplex", "./hate/cpml/modules/simplex.lua")
aio.mod("hate.cpml.modules.quat", "./hate/cpml/modules/quat.lua")
aio.mod("hate.cpml.modules.color", "./hate/cpml/modules/color.lua")
aio.mod("hate.cpml.modules.mat4", "./hate/cpml/modules/mat4.lua")
aio.mod("hate.cpml.modules.quadtree", "./hate/cpml/modules/quadtree.lua") -- ?
aio.mod("hate.cpml.modules.vec2", "./hate/cpml/modules/vec2.lua")
aio.mod("hate.cpml.modules.mesh", "./hate/cpml/modules/mesh.lua")
aio.mod("hate.cpml.modules.octree", "./hate/cpml/modules/octree.lua") -- ?
aio.mod("hate.cpml.modules.utils", "./hate/cpml/modules/utils.lua")
aio.mod("hate.cpml.init", "./hate/cpml/init.lua")
aio.mod("hate.timer", "./hate/timer.lua")
aio.mod("hate.physfs", "./hate/physfs.lua")
aio.mod("hate.math", "./hate/math.lua")
aio.mod("hate.init", "./hate/init.lua")
aio.finish()
aio.autoaliases()
aio.code("init.lua")
aio.finish()
' > "./allinone/hate-allinone-$mode.lua"

done

