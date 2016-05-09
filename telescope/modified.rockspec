build = {
  type = "builtin",
  modules = {
    "telescope.lua",
    ["telescope.compat_env"] = "telescope/compat_env.lua"
  },
  install = {
    bin = {
      "tsc"
    }
  }
}
