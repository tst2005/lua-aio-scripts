build = {
  type = "builtin",
  modules = {
    ["pl"] = "thirdparty/lua-penlight/pl.lua",
    ["markdown"] = "thirdparty/markdown/markdown.lua",
  },
  install = {
    bin = {
      ldoc = "aio/ldoc-only.lua"
    }
  }
}
