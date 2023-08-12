return function()
  local au = vim.api.nvim_create_autocmd
  local aug = vim.api.nvim_create_augroup

  au("BufEnter", {
    group = aug("no_comment_on_enter", { clear = true }),
    desc = "No longer comments upon newline",
    callback = function() vim.opt_local.formatoptions:remove { "c", "r", "o" } end,
  })

  au("FocusGained", {
    group = aug("auto_file_reload", { clear = true }),
    desc = "Reloads file when change is detected",
    command = "checktime",
  })

  -- au("ModeChanged", {
  --   group = aug("exit_luasnip_on_mode_change", { clear = true }),
  --   desc = "Avoids weird jumping fiasco of luasnip",
  --   callback = function()
  --     if
  --       ((vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n") or vim.v.event.old_mode == "i")
  --       and require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
  --       and not require("luasnip").session.jump_active
  --     then
  --       require("luasnip").unlink_current()
  --     end
  --   end,
  -- })
end
