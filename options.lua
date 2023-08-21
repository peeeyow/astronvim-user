return function(local_vim)
  local_vim.opt.fillchars = {
    horiz = "━",
    horizup = "┻",
    horizdown = "┳",
    vert = "┃",
    vertleft = "┫",
    vertright = "┣",
    verthoriz = "╋",
  }
  local_vim.opt.wrap = true
  local_vim.g.resession_enabled = true
  local_vim.g.maplocalleader = [[\]]
  local_vim.opt.shortmess = vim.opt.shortmess + "c"
  local_vim.opt.nrformats = vim.opt.nrformats + { "alpha", "octal", "hex" }
  local_vim.opt.whichwrap = vim.opt.whichwrap + "<>[]hl"
  return local_vim
end
