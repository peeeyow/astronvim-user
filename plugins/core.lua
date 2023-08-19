local function on_file_remove(args)
  local ts_clients = vim.lsp.get_active_clients { name = "tsserver" }
  for _, ts_client in ipairs(ts_clients) do
    ts_client.request("workspace/executeCommand", {
      command = "_typescript.applyRenameFile",
      arguments = {
        {
          sourceUri = vim.uri_from_fname(args.source),
          targetUri = vim.uri_from_fname(args.destination),
        },
      },
    })
  end
end

return {
  { "max397574/better-escape.nvim", enabled = false },
  { "akinsho/toggleterm.nvim", enabled = false },
  {
    "numToStr/Comment.nvim",
    keys = {
      {
        "<C-_>",
        function() require("Comment.api").toggle.linewise.current() end,
        desc = "Line comment",
      },
      {
        "<C-/>",
        function() require("Comment.api").toggle.linewise.current() end,
        desc = "Line comment",
      },
      {
        [[<C-\>]],
        function() require("Comment.api").toggle.blockwise.current() end,
        desc = "Block comment",
      },
      {
        "<C-_>",
        function()
          local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
          vim.api.nvim_feedkeys(esc, "nx", false)
          require("Comment.api").toggle.linewise(vim.fn.visualmode())
        end,
        mode = { "x" },
        desc = "Visual Line comment",
      },
      {
        "<C-/>",
        function()
          local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
          vim.api.nvim_feedkeys(esc, "nx", false)
          require("Comment.api").toggle.linewise(vim.fn.visualmode())
        end,
        mode = { "x" },
        desc = "Visual Line comment",
      },
      {
        [[<C-\>]],
        function()
          local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
          vim.api.nvim_feedkeys(esc, "nx", false)
          require("Comment.api").toggle.blockwise(vim.fn.visualmode())
        end,
        mode = { "x" },
        desc = "Visual Block comment",
      },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      char = "▎",
      context_char = "▎",
      use_treesitter = true,
      show_current_context_start = true,
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      local events = require "neo-tree.events"
      return require("astronvim.utils").extend_tbl(opts, {
        window = {
          mappings = {
            ["<C-v>"] = "open_vsplit",
            ["<C-x>"] = "open_split",
            ["<cr>"] = "open_with_window_picker",
          },
        },
        event_handlers = {
          {
            event = events.FILE_MOVED,
            handler = on_file_remove,
          },
          {
            event = events.FILE_RENAMED,
            handler = on_file_remove,
          },
        },
      })
    end,
  },
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      opts.section.header.val = {
        "███    ██ ██    ██ ██ ███    ███",
        "████   ██ ██    ██ ██ ████  ████",
        "██ ██  ██ ██    ██ ██ ██ ████ ██",
        "██  ██ ██  ██  ██  ██ ██  ██  ██",
        "██   ████   ████   ██ ██      ██",
      }
    end,
  },
}
