local function delete_empty()
  if vim.api.nvim_get_current_line():match "^%s*$" then
    return [["_dd]]
  else
    return "dd"
  end
end

return {
  n = {
    ["<C-d>"] = { "<C-d>zz" },
    ["<C-u>"] = { "<C-u>zz" },
    ["n"] = { "nzzzv" },
    ["N"] = { "Nzzzv" },
    ["J"] = { "mzJ`z" },
    ["<M-j>"] = { ":m .+1<cr>==", desc = "Move line one step below" },
    ["<M-k>"] = { ":m .-2<cr>==", desc = "Move line one step above" },
    ["dd"] = { delete_empty, expr = true },
    ["<leader>h"] = { ":noh<cr>", desc = "Remove search highlight" },
    ["<leader>/"] = false,
  },
  v = {
    ["<"] = { "<gv" },
    [">"] = { ">gv" },
    ["<M-j>"] = { ":m '>+1<cr>gv-gv", desc = "Move line one step below" },
    ["<M-k>"] = { ":m '<-2<cr>gv-gv", desc = "Move line one step above" },
    ["<leader>/"] = false,
  },
  x = {
    ["p"] = { "p:let @+=@0<cr>" },
  },
}
