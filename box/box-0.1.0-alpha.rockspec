
package = 'busted'
version = '2.0.rc6-0'
source = {
  url = 'https://github.com/tst2005/lua-box/archive/v0.1.0-alpha.tar.gz',
  dir = 'busted-2.0.rc6'
}
description = {
  summary = 'lua-box ...',
  detailed = [[
...
  ]],
  homepage = 'https://github.com/tst2005/lua-box/',
  license = 'MIT <http://opensource.org/licenses/MIT>'
}
dependencies = {
  'lua >= 5.1, <5.4',
}
build = {
  type = 'builtin',
  modules = {
    ["pl"] = "thirdparty/lua-penlight/pl.lua",
    ["markdown"] = "thirdparty/markdown/markdown.lua",
  },
--[[
  install = {
    bin = {
      ldoc = "aio/ldoc-only.lua"
    }
  }
]]--
}
