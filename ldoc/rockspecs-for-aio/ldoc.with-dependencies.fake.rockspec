build = {
  type = "builtin",
  modules = {
    ["pl"] = "lua-penlight/pl.lua",
    ["markdown"] = "markdown/markdown.lua",
  },
  install = {
    bin = {
      ldoc = "generated-bundle/ldoc-only.lua"
    }
  }
}
