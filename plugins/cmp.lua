return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require "cmp"
    local snip_status_ok, luasnip = pcall(require, "luasnip")

    if not snip_status_ok then return end

    local function has_words_before()
      local line, col = (unpack or table.unpack)(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
    end

    opts.experimental = {
      ghost_text = true,
    }
    opts.mapping["<C-j>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select }
    opts.mapping["<C-k>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select }
    opts.mapping["<C-y>"] = cmp.mapping.confirm { select = false }
    opts.mapping["<CR>"] = cmp.mapping.confirm { select = false }
    opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
      if luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" })
    opts.mapping["<S-Tab>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" })
    return opts
  end,
}
