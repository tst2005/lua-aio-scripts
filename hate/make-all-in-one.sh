#!/bin/sh

# see https://github.com/tst2005/lua-aio
# wget https://raw.githubusercontent.com/tst2005/lua-aio/aio.lua
# wget https://raw.githubusercontent.com/tst2005/lua-aio/aio-cli
ALLINONE=./aio-cli

for mode in lua raw raw2; do

"$ALLINONE" \
--shebang init.lua \
--mode "$mode" \
--mod hate.graphics			hate/graphics.lua \
--mod hate.opengl			hate/opengl.lua \
--mod hate.window			hate/window.lua \
--mod hate.system			hate/system.lua \
--mod hate.filesystem			hate/filesystem.lua \
--mod hate.sdl2.defines			hate/sdl2/defines.lua \
--mod hate.sdl2.cdefs			hate/sdl2/cdefs.lua \
--mod hate.sdl2.init			hate/sdl2/init.lua \
--mod hate.cpml.modules.intersect	hate/cpml/modules/intersect.lua \
--mod hate.cpml.modules.vec3		hate/cpml/modules/vec3.lua \
--mod hate.cpml.modules.constants	hate/cpml/modules/constants.lua \
--mod hate.cpml.modules.simplex		hate/cpml/modules/simplex.lua \
--mod hate.cpml.modules.quat		hate/cpml/modules/quat.lua \
--mod hate.cpml.modules.color		hate/cpml/modules/color.lua \
--mod hate.cpml.modules.mat4		hate/cpml/modules/mat4.lua \
--mod hate.cpml.modules.vec2		hate/cpml/modules/vec2.lua \
--mod hate.cpml.modules.mesh		hate/cpml/modules/mesh.lua \
--mod hate.cpml.modules.utils		hate/cpml/modules/utils.lua \
--mod hate.cpml.init			hate/cpml/init.lua \
--mod hate.timer			hate/timer.lua \
--mod hate.physfs			hate/physfs.lua \
--mod hate.math				hate/math.lua \
--mod hate.init				hate/init.lua \
--finish \
--autoaliases \
--code init.lua \
--finish \
> "./hate-allinone-$mode.lua"

done

#"$ALLINONE" --shebang init.lua $( find hate/ -depth -name '*.lua' |while read -r line; do echo "--mod $(echo "$line" | sed 's,\.lua$,,g' | tr / .) ) --code init.lua

