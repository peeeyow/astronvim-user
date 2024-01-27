return {
  {
    "rcarriga/nvim-dap-ui",
    keys = {
      {
        "<leader>dU",
        function() require("dapui").open { reset = true } end,
        desc = "Reset dap UI",
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
    end,
  },
}
