return function()
  local create_autocmd = vim.api.nvim_create_autocmd
  local create_autogroup = vim.api.nvim_create_augroup
  local create_user_command = vim.api.nvim_create_user_command

  create_autocmd("BufEnter", {
    group = create_autogroup("no_comment_on_enter", { clear = true }),
    desc = "No longer comments upon newline",
    callback = function() vim.opt_local.formatoptions:remove { "c", "r", "o" } end,
  })

  create_autocmd("FocusGained", {
    group = create_autogroup("auto_file_reload", { clear = true }),
    desc = "Reloads file when change is detected",
    command = "checktime",
  })

  create_user_command("ObsNew", "ObsidianNew", {})

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
