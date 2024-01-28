return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("dap.ext.vscode").load_launchjs()
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    keys = {
      {
        "<leader>dU",
        function() require("dapui").open { reset = true } end,
        desc = "Reset dap UI",
      },
      {
        "<leader>df",
        function() require("dap-python").test_method() end,
        desc = "Test method",
      },
      {
        "<leader>dx",
        function() require("dap-python").test_class() end,
        desc = "Test Class",
      },
      {
        "<leader>ds",
        function() require("dap-python").debug_selection() end,
        desc = "Debug selection",
        mode = "v",
      },
    },
  },
  {
    "mfussenegger/nvim-dap-python",
    dependencies = "mfussenegger/nvim-dap",
    ft = "python",
    config = function(_, opts)
      local path = require("mason-registry").get_package("debugpy"):get_install_path() .. "/venv/bin/python"
      require("dap-python").setup(path, opts)

      table.insert(require("dap").configurations.python, {
        type = "python",
        request = "launch",
        name = "Django",
        program = vim.fn.getcwd() .. "/manage.py",
        args = { "runserver", "--noreload" },
        django = true,
      })
    end,
  },
}
