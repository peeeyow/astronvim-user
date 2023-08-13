return {
  "L3MON4D3/LuaSnip",
  opts = {
    history = false,
  },
  config = function(plugin, opts)
    require "plugins.configs.luasnip"(plugin, opts)
    require("luasnip.loaders.from_vscode").lazy_load { paths = "./lua/user/snippets" }
    require("luasnip").filetype_extend("htmldjango", { "djangohtml" })
  end,
}
