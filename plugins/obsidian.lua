local prefix = "<leader>o"
return {
  "epwalsh/obsidian.nvim",
  event = { "BufReadPre " .. vim.fn.expand "~" .. "/obsidian/main-vault/**.md" },
  cmd = {
    "ObsidianOpen",
    "ObsidianNew",
    "ObsidianQuickSwitch",
    "ObsidianFollowLink",
    "ObsidianBacklinks",
    "ObsidianToday",
    "ObsidianYesterday",
    "ObsidianTemplate",
    "ObsidianSearch",
    "ObsidianLink",
    "ObsidianLinkNew",
  },
  keys = {
    {
      "gf",
      function()
        if require("obsidian").util.cursor_on_markdown_link() then
          return "<cmd>ObsidianFollowLink<CR>"
        else
          return "gf"
        end
      end,
      noremap = false,
      expr = true,
    },
    { prefix .. "o", "<cmd>ObsidianOpen<cr>", desc = "Open current buffer in Obsidian" },
    { prefix .. "n", "<cmd>ObsidianNew<cr>", desc = "Create new zettelkasten note" },
    { prefix .. "q", "<cmd>ObsidianQuickSwitch<cr>", desc = "Switch notes" },
    { prefix .. "b", "<cmd>ObsidianBacklinks<cr>", desc = "Open Backlinks" },
    { prefix .. "T", "<cmd>ObsidianToday<cr>", desc = "Create a new daily  note" },
    { prefix .. "Y", "<cmd>ObsidianYesterday<cr>", desc = "Open yesterday's daily note" },
    { prefix .. "t", "<cmd>ObsidianTemplate<cr>", desc = "Search for note template" },
    { prefix .. "f", "<cmd>ObsidianSearch<cr>", desc = "Search for notes in vault" },
    { prefix .. "l", "<cmd>ObsidianLink<cr>", mode = { "v" }, desc = "Link selection to existing note" },
    { prefix .. "L", "<cmd>ObsidianLinkNew<cr>", mode = { "v" }, desc = "Create new link for current selection" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    dir = vim.env.HOME .. "/obsidian/main-vault",

    notes_subdir = "zettelkasten",

    daily_notes = {
      folder = "dailies",
    },

    templates = {
      subdir = "templates",
      date_format = "%Y-%m-%d-%a",
      time_format = "%H:%M",
    },

    completion = {
      new_notes_location = "current_dir",
    },

    note_id_func = function(title)
      local suffix = ""
      if title ~= nil then
        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return tostring(os.time()) .. "-" .. suffix
    end,

    mappings = {},

    disable_frontmatter = false,

    note_frontmatter_func = function(note)
      local out = { id = note.id, aliases = note.aliases, tags = note.tags }
      if note.metadata ~= nil and require("obsidian").util.table_length(note.metadata) > 0 then
        for k, v in pairs(note.metadata) do
          out[k] = v
        end
      end
      return out
    end,

    follow_url_func = vim.ui.open or require("astronvim.utils").system_open,

    use_advanced_uri = true,
    finder = "telescope.nvim",
  },
}
