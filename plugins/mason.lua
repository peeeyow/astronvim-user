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
      return opts
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
      })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        "black",
        "flake8",
        "prettierd",
        "stylua"
      })
      return opts
    end,
  },
}
