local is_available = require("astronvim.utils").is_available

local maps = {
  n = {
    ["<C-d>"] = { "<C-d>zz" },
    ["<C-u>"] = { "<C-u>zz" },
    ["n"] = { "nzzzv" },
    ["N"] = { "Nzzzv" },
    ["J"] = { "mzJ`z" },
    ["<M-j>"] = { ":m .+1<cr>==", desc = "Move line one step below" },
    ["<M-k>"] = { ":m .-2<cr>==", desc = "Move line one step above" },
    ["dd"] = {
      function()
        if vim.api.nvim_get_current_line():match "^%s*$" then
          return [["_dd]]
        else
          return "dd"
        end
      end,
      expr = true,
    },
    ["<leader>gr"] = { function() require("gitsigns").reset_hunk() end, desc = "Reset Git hunk" },
    ["<leader>gR"] = { function() require("gitsigns").reset_buffer() end, desc = "Reset Git buffer" },
    ["<leader>h"] = { "<cmd>noh<cr>", desc = "Remove search highlight" },
    ["<leader>L"] = {
      function() require("notify").dismiss { pending = true, silent = true } end,
      desc = "Dismiss all notifictions",
    },
    ["<leader>o"] = { name = "Obsidian", desc = "󱞁 Obsidian" },
    ["<leader>/"] = false,
    ["|"] = false,
    ["\\"] = false,
  },
  v = {
    ["<"] = { "<gv" },
    [">"] = { ">gv" },
    ["<M-j>"] = { ":m '>+1<cr>gv-gv", desc = "Move line one step below" },
    ["<M-k>"] = { ":m '<-2<cr>gv-gv", desc = "Move line one step above" },
    ["<leader>/"] = false,
    ["<Tab>"] = false,
    ["<S-Tab>"] = false,
    ["<leader>o"] = { name = "Obsidian", desc = "󱞁 Obsidian" },
  },
  x = {
    ["p"] = { "p:let @+=@0<cr>" },
  },
}

if is_available "alpha-nvim" then
  maps.n["<leader>H"] = {
    function()
      local wins = vim.api.nvim_tabpage_list_wins(0)
      if #wins > 1 and vim.api.nvim_get_option_value("filetype", { win = wins[1] }) == "neo-tree" then
        vim.fn.win_gotoid(wins[2]) -- go to non-neo-tree window to toggle alpha
      end
      require("alpha").start(false, require("alpha").default_config)
    end,
    desc = "Home Screen",
  }
end

if is_available "neo-tree.nvim" then
  maps.n["<leader>O"] = {
    function()
      if vim.bo.filetype == "neo-tree" then
        vim.cmd.wincmd "p"
      else
        vim.cmd.Neotree "focus"
      end
    end,
    desc = "Toggle Explorer Focus",
  }
end

return maps
