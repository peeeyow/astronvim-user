return {
  "iurimateus/luasnip-latex-snippets.nvim",
  ft = { "markdown", "plaintex", "tex" },
  dependencies = {
    "L3MON4D3/LuaSnip",
  },
  opts = {
    use_treesitter = false,
    allow_on_markdown = true,
  },
  config = function(_, opts) require("luasnip-latex-snippets").setup(opts) end,
}
