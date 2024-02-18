local playground = {
  enable = true,
  disable = {},
  updatetime = 25,
  persist_queries = false,
  keybindings = {
    toggle_query_editor = "o",
    toggle_hl_groups = "i",
    toggle_injected_languages = "t",
    toggle_anonymous_nodes = "a",
    toggle_language_display = "I",
    focus_language = "f",
    unfocus_language = "F",
    update = "R",
    goto_node = "<cr>",
    show_help = "?",
  },
}

return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "HiPhish/rainbow-delimiters.nvim",
    "nvim-treesitter/playground",
    "andymass/vim-matchup",
  },
  opts = function(_, opts)
    return require("astronvim.utils").extend_tbl(opts, {
      ensure_installed = "all",
      playground = playground,
      matchup = {
        enable = true,
      },
      highlight = {
        additional_vim_regex_highlighting = { "markdown" },
        disable = { "latex" },
      },
    })
  end,
}
