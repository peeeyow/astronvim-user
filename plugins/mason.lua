return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        "bashls",
        "cssls",
        "eslint",
        "dockerls",
        "emmet_ls",
        "graphql",
        "html",
        "jsonls",
        "prismals",
        "pyright",
        "lua_ls",
        "tailwindcss",
        "tsserver",
        "yamlls",
      })
      opts.automatic_installation = true
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        "black",
        "flake8",
        "prettierd",
      })
      opts.automatic_installation = { exclude = { "mypy" } }
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {})
    end,
  },
}
