return {
  "L3MON4D3/LuaSnip",
  opts = {
    history = false,
  },
  config = function(plugin, opts)
    opts = require("astronvim.utils").extend_tbl(opts, {
      enable_autosnippets = true,
      store_selection_keys = "<Tab>",
    })
    require "plugins.configs.luasnip"(plugin, opts)
    require("luasnip.loaders.from_vscode").lazy_load { paths = "./lua/user/snippets" }
    require("luasnip").filetype_extend("htmldjango", { "djangohtml" })
  end,
}
